StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Template'
		code: [World submorphs detect: [ :sm |	sm isSystemWindow and: [ sm label = PharoWelcomePage title ]] ifFound: #delete.		]
		runOnce: true.	
}