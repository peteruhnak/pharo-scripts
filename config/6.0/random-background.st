StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Random background'
		code: [Pharo3DarkTheme beCurrent.World	backgroundImage: (ImageReadWriter formFromFileNamed: ((FileLocator home asFileReference / 'Images' / 'wp') allFiles atRandom: Random new))	layout: #scaled.		]
		runOnce: true.	
}