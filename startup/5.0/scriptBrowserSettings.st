StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'load a script browser'
		code: [
			Gofer new
				url: 'filetree:///home/peter/prog/script-browser';
			    package: 'ScriptBrowser';
				load.
		]
		runOnce: true.
}
