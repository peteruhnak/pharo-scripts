StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Array autoformatting: #(#a #b) -> #(a b)'
		code: [

BIConfigurableFormatter compile: 'visitLiteralNode: aLiteralNode
	aLiteralNode value isLiteral
		ifFalse: [ ^ self writeString: ''''''<an unprintable nonliteral value>'''''' ].
	aLiteralNode parent isLiteralArray
		ifTrue: [ self writeString: (aLiteralNode sourceText withoutPrefix: ''#'') ]
		ifFalse: [ self writeString: aLiteralNode sourceText ]'.

		]
		runOnce: true.

	StartupAction
		name: 'Needs Parenthesis {(#a -> #b)} -> {#a -> #b}'
		code: [

BIConfigurableFormatter compile: (
	(BIConfigurableFormatter>>#needsParenthesisFor:) sourceCode
		copyReplaceAll: 'parent := aNode parent ifNil: [ ^ false ].'
		with: 	'parent := aNode parent ifNil: [ ^ false ].
	parent isDynamicArray ifTrue: [ ^ false ].'
).

		]
		runOnce: true.
}
