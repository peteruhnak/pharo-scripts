StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: '60-ish FPS'
		code: [

"The default is 20ms, which is 50 FPS"
WorldState MinCycleLapse: 16.

		]
		runOnce: true.
}
