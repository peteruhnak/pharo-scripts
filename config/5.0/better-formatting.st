StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Nicer Array autoformatting #(#a #b) -> #(a b)'
		code: [BIConfigurableFormatter compile: 'visitLiteralNode: aLiteralNode	aLiteralNode value isLiteral		ifFalse: [ ^ self writeString: ''''''<an unprintable nonliteral value>'''''' ].	aLiteralNode parent isLiteralArray		ifTrue: [ self writeString: (aLiteralNode sourceText withoutPrefix: ''#'') ]		ifFalse: [ self writeString: aLiteralNode sourceText ]'.		]
		runOnce: true.	
	StartupAction
		name: 'Needs Parenthesis {(#a -> #b)} -> {#a -> #b}'
		code: [BIConfigurableFormatter compile: (	(BIConfigurableFormatter>>#needsParenthesisFor:) sourceCode		copyReplaceAll: 'parent := aNode parent ifNil: [ ^ false ].'		with: 	'parent := aNode parent ifNil: [ ^ false ].	parent isArray ifTrue: [ ^ false ].').		]
		runOnce: true."	StartupAction
		name: 'Do not multiline @ messages. {1@2.\n#x} -> {1@2 . #x}'
		code: [BIConfigurableFormatter compile: ((BIConfigurableFormatter>>#formatArray:) sourceCode	copyReplaceAll: '[ :each | each className = ''RBLiteralValueNode'' ]'	with: '[ :each | each className = ''RBLiteralValueNode'' or: [ each className = #RBMessageNode and: [ each selector = #@ ] ] ]')		]
		runOnce: true."}