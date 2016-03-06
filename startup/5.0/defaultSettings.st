StartupPreferencesLoader default executeAtomicItems: {
		StartupAction
			name: 'Dark theme'
			code: [ "Pharo3DarkTheme installFullTheme." ]
			runOnce: true.					StartupAction
			name: 'Install & populate QuickAccess'
			code: [				Metacello new					configuration: 'QuickAccess';					smalltalkhubUser: 'TorstenBergmann' project: 'QuickAccess';					load.				#QACActionManager asClass default					import: ('/home/peter/.config/pharo/5.0/quickaccess.qac' asFileReference).			]
			runOnce: true.

		StartupAction
			name: 'Blank lines'
			code: [
				"RBConfigurableFormatter retainBlankLinesBetweenStatements: true.
				RBConfigurableFormatter retainBlankLinesBeforeComments: true."
				NECPreferences popupShowWithShortcut: Character tab asKeyCombination.
			]
			runOnce: true.					StartupAction
			name: 'Allow method creation completion'
			code: [
				"https://pharo.fogbugz.com/f/cases/17261/When-creating-methods-the-name-can-no-longer-be-autocompleted"
				NECPreferences overrideModel:true.
			]
			runOnce: true.
}
