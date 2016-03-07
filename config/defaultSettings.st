StartupPreferencesLoader default executeAtomicItems: {
		StartupAction
			name: 'Set the Author'
			code: [ Author fullName: 'PeterUhnak'. ]
			runOnce: true.

		StartupAction
			name: 'GTSpotter usage data'
			code: [
				(Smalltalk globals includesKey: #GTSpotterEventRecorderSettings) ifTrue: [
					#GTSpotterEventRecorderSettings asClass sendUsageData: true
				]
			]
			runOnce: true.

		StartupAction
			name: 'No logo'
			code: [	PolymorphSystemSettings showDesktopLogo: false. ]
			runOnce: true.
}
