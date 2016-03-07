StartupLoader default executeAtomicItems: {
	StartupAction name: 'Enable development environment' code: '(Smalltalk at: #PhLDeploymentScript) perform: #developmentEnvironmentEnabled: with: (false)'.
	StartupAction name: 'Location of your images' code: '(Smalltalk at: #PhLDirectoryBasedImageRepository) perform: #locationString: with: (''/home/peter/.local/share/Pharo/images'')'.
	StartupAction name: 'Quit On Launch' code: '(Smalltalk at: #PhLLaunchImageCommand) perform: #quitOnLaunch: with: (true)'.
	StartupAction name: 'VM Full Path' code: '(Smalltalk at: #PhLLaunchImageCommand) perform: #vmFullPath: with: ('''')'.
	StartupAction name: 'Spur VM Full Path' code: '(Smalltalk at: #PhLLaunchImageCommand) perform: #spurFullPath: with: (''/opt/pharo-vm/spur/pharo'')'.
	StartupAction name: 'Use HTTP proxy' code: '(Smalltalk at: #NetworkSystemSettings) perform: #useHTTPProxy: with: (false)'.
	StartupAction name: 'Port' code: '(Smalltalk at: #NetworkSystemSettings) perform: #httpProxyPort: with: (80)'.
	StartupAction name: 'Server' code: '(Smalltalk at: #NetworkSystemSettings) perform: #httpProxyServer: with: ('''')'.
	StartupAction name: 'Exceptions' code: '(Smalltalk at: #NetworkSystemSettings) perform: #manageHttpProxyExceptions: with: ('''')'.
	StartupAction name: 'Templates cleared at startup' code: '(Smalltalk at: #PharoLauncher) perform: #templatesClearedOnStartup: with: (false)'.
}.

