StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Save st scripts with lf endings'
		code: [

|rewriter tree|

rewriter := RBParseTreeRewriter new
	replace: 's nextPutAll: text text asString'
	with: 's wantsLineEndConversion: true; nextPutAll: text text asString'.

tree := (FileReference>>#gtInspectorStScriptIn:) parseTree.
rewriter executeTree: tree.
tree methodClass compile: rewriter tree formattedCode.

		]
		runOnce: true.
}