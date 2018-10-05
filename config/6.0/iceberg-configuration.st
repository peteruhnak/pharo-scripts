StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Iceberg setup'
		code: [

|conf|
conf := (STON fromStream: (FileLocator preferences asFileReference / 'pharo' / 'settings.json') readStream) at: #iceberg.

(IceRepository respondsTo: #shareRepositoriesBetweenImages:) ifTrue: [

Iceberg enableMetacelloIntegration: true.

IceRepository shareRepositoriesBetweenImages: false.

IceCredentialsProvider useCustomSsh: true.
IceCredentialsProvider sshCredentials
	publicKey: ((conf at: 'sshCredentials') at: 'publicKey');
	privateKey: ((conf at: 'sshCredentials') at: 'privateKey');
	keyPassphrase: ((conf at: 'sshCredentials') at: 'keyPassphrase').

IceCredentialsProvider plaintextCredentials
	username: ((conf at: 'plaintextCredentials') at: 'username');
	password: ((conf at: 'plaintextCredentials') at: 'password')

]
		]
		runOnce: true.	
}
