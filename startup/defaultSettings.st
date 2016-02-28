StartupPreferencesLoader default executeAtomicItems: {
		StartupAction
			name: 'Set the Author'
			code: [ Author fullName: 'PeterUhnak'. ]
			runOnce: true.

		StartupAction
			name: 'Set fonts'
			code: [
				"FreeTypeSystemSettings loadFt2Library: false.
				FreeTypeSystemSettings loadFt2Library: true."

				"StandardFonts defaultFont: (LogicalFont familyName: 'DejaVu Sans Mono' pointSize: '9' ).
				GraphicFontSettings resetAllFontToDefault."
			]
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
