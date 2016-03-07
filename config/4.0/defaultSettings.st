StartupPreferencesLoader default executeAtomicItems: {
		StartupAction
			name: 'Dark theme'
			code: [ "Pharo3DarkTheme installFullTheme." ]
			runOnce: true.

		StartupAction
			name: 'Blank lines'
			code: [
				RBConfigurableFormatter retainBlankLinesBetweenStatements: true.
				RBConfigurableFormatter retainBlankLinesBeforeComments: true.
				NECPreferences popupShowWithShortcut: Character tab asKeyCombination.
			]
			runOnce: true.
}
