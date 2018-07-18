StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Disable & Ignore ShoreLine'
		code: [

SlReporter enabled: false.
SlReporter autoSubmit: false.
SlReporter host: ''.


		]
		runOnce: true.
}