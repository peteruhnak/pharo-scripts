StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Modify world menu'
		code: [

(FileLocator preferences asFileReference / 'pharo/7.0/MyWorldMenu.st') fileIn.

		]
		runOnce: true.
}