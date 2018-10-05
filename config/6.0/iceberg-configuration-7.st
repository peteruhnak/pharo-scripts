StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Iceberg setup'
		code: [

|conf creds|
conf := (STON fromStream: (FileLocator preferences asFileReference / 'pharo' / 'settings.json') readStream) at: #iceberg.

(IceLibgitRepository respondsTo: #shareRepositoriesBetweenImages:) ifTrue: [

Iceberg enableMetacelloIntegration: true.

IceLibgitRepository shareRepositoriesBetweenImages: false.

IceLibgitRepository defaultCodeSubdirectory: 'repository'.

IceCredentialsProvider useCustomSsh: true.
creds := conf at: 'credentials'.

creds detect: [ :each | (each at: 'type') = 'ssh' ] ifFound: [ :cred |
	IceCredentialsProvider sshCredentials
		publicKey: (cred at: 'publicKey');
		privateKey: (cred at: 'privateKey');
		keyPassphrase: (cred at: 'keyPassphrase').
].

creds select: [ :each | (each at: 'type') = 'plaintext' ] thenDo: [ :cred |
	IceCredentialStore current
		storeCredential: (
			IcePlaintextCredentials new
				username: (cred at: 'username');
				password: (cred at: 'password'))
		forHostname: (cred at: 'hostname').
]

]
		]
		runOnce: true.	
}
