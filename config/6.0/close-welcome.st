StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Close Pharo Welcome Window'
		code: [

World submorphs
	select: [ :each | (each isKindOf: SystemWindow) and: [ each label = WelcomeHelp bookName ] ]
	thenDo: #delete.

		]
		runOnce: true.
}