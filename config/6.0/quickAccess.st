StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Install & populate QuickAccess'
		code: [
			"Metacello new
				configuration: 'QuickAccess';
				smalltalkhubUser: 'TorstenBergmann' project: 'QuickAccess';
				load."
			Metacello new
				configuration: 'QuickAccess';
				repository: (FileLocator home asFileReference / 'prog/QuickAccess/repository') pathString;
				load.
			#QACActionManager asClass default
				import: (FileLocator preferences asFileReference / 'pharo/5.0/quickaccess.qac').
		]
		runOnce: true.

	StartupAction
		name: 'Reload QuickAccess config'
		code: [
			(Smalltalk hasClassNamed: #QACActionManager) ifTrue: [
				#QACActionManager asClass default
					import: (FileLocator preferences asFileReference / 'pharo/5.0/quickaccess.qac').
			]
		]
		runOnce: false.	
}