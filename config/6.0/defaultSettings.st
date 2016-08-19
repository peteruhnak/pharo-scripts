StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Dark theme'
		code: [ "Pharo3DarkTheme installFullTheme." ]
		runOnce: true.


	StartupAction
		name: 'Blank lines'
		code: [
			"RBConfigurableFormatter retainBlankLinesBetweenStatements: true.
			RBConfigurableFormatter retainBlankLinesBeforeComments: true."
			NECPreferences popupShowWithShortcut: Character tab asKeyCombination.
		]
		runOnce: true.
			
	StartupAction
		name: 'Allow method creation completion'
		code: [
			"https://pharo.fogbugz.com/f/cases/17261/When-creating-methods-the-name-can-no-longer-be-autocompleted"
			NECPreferences overrideModel: true.
		]
		runOnce: true.
}
