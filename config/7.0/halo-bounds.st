StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Show bounds of the active halo'
		code: [

HaloMorph showBoundsInHalo: true

		]
		runOnce: true.
}