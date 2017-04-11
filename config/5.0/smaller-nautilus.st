StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Make Nautilus windows slightly more narrow so they fit on top of each other.'
		code: [

NautilusWindow compile: 'initialExtent
	^ 850@550'.

		]
		runOnce: true.
}