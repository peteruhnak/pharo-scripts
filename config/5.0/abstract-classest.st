StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Show abstract classes in italics'
		code: [

ClassWidget compile: ((ClassWidget>>#buildTabbedNameOf:) sourceCode copyReplaceAll: 'anElement hasAbstractMethods' with: 'anElement hasAbstractMethods | ((anElement respondsTo: #isAbstract) and: [ anElement isAbstract ])').

		]
		runOnce: true.
}