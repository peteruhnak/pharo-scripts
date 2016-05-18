StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Nicer Array autoformatting'
		code: [BIConfigurableFormatter compile: 'visitLiteralNode: aLiteralNode	aLiteralNode value isLiteral		ifFalse: [ ^ self writeString: ''''''<an unprintable nonliteral value>'''''' ].	aLiteralNode parent isLiteralArray		ifTrue: [ self writeString: (aLiteralNode sourceText withoutPrefix: ''#'') ]		ifFalse: [ self writeString: aLiteralNode sourceText ]'.		]
		runOnce: true.	
}