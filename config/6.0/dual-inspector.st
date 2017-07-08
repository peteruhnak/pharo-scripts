StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Open Inspector on the right monitor'
		code: [

|rewriter|
rewriter := RBParseTreeRewriter new
	replaceTree: (RBParser parseExpression: 'w := Display width.')
	withTree: (RBParser parseExpression: 'w := Display width.
		w > 2000 ifTrue: [ w := w // 2 ].').

(rewriter executeTree: (GTMoldableDebugger>>#initialExtent) parseTree)
	ifTrue: [ GTMoldableDebugger compile: rewriter tree formattedCode. ]

		]
		runOnce: true.
}
