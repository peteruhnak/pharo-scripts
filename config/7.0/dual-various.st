StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Various changes related to dual-monitor setup'
		code: [
World taskbars first listDirection: #rightToLeft.
GrowlMorph position: #bottomRight.

		]
		runOnce: true.
}