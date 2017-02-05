StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Print UUID as string, not as ByteArray'
		code: [

UUID compile: 'gtDisplayOn: s
	self printOn: s' classified: 'printing'.


		]
		runOnce: true.
}