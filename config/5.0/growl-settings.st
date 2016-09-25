StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Show Growl in bottom right corner'
		code: [

GrowlMorph position: #bottomRight

		]
		runOnce: true.
}