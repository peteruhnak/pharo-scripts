StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'QA should take at most two rows'
		code: [

|code|
code := (QANautilusPluginMorph>>#initialize) sourceCode copyReplaceAll: '51' with: '34'.

QANautilusPluginMorph compile: code.


		]
		runOnce: true.
}