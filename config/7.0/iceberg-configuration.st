StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Iceberg setup'
		code: [

|conf|
conf := (STON fromStream: (FileLocator preferences asFileReference / 'pharo' / 'settings.json') readStream) at: #iceberg.

(Smalltalk hasClassNamed: #Iceberg) ifTrue: [

Iceberg enableMetacelloIntegration: true.

IceLibgitRepository shareRepositoriesBetweenImages: false.

IceLibgitRepository defaultCodeSubdirectory: 'repository'.

IceCredentialsProvider useCustomSsh: true.
IceCredentialsProvider sshCredentials
	publicKey: ((conf at: 'sshCredentials') at: 'publicKey');
	privateKey: ((conf at: 'sshCredentials') at: 'privateKey');
	keyPassphrase: ((conf at: 'sshCredentials') at: 'keyPassphrase').

IceCredentialStore current
	storeCredential: (
		IcePlaintextCredentials new
			username: ((conf at: 'plaintextCredentials') at: 'username');
			password: ((conf at: 'plaintextCredentials') at: 'password'))
	forHostname: 'github.com'.

]
		]
		runOnce: true.	
}