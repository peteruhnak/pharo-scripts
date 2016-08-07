StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Install & use FileDialog'
		code: [			Metacello new				baseline: 'FileDialog';				repository: 'filetree:///home/peter/prog/file-dialog/repository';				load.						FDMorphicUIManager new beDefault.						FDFileDialog basicNew				addBookmark: FileLocator home asFileReference / 'prog'		]
		runOnce: true.
}