StartupPreferencesLoader default executeAtomicItems: {

	StartupAction
		name: 'Blank lines'
		code: [
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

	StartupAction
		name: 'Use extended completion'
		code: [
			NECPreferences captureNavigationKeys: true.
		]
		runOnce: true.

	StartupAction
		name: 'No case-sensitive completion'
		code: [
			NECPreferences caseSensitive: false.
		]
		runOnce: true.
}
