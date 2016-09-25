StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Open Inspector on the right monitor'
		code: [

|code|
code := (GTMoldableDebugger>>#initialExtent) sourceCode.
GTMoldableDebugger compile: (code copyReplaceAll: 'w := Display width.
		h := Display height.' with: 'w := Display width.
		w > 2000 ifTrue: [ w := w // 2 ].
		h := Display height.')

		]
		runOnce: true.
}
