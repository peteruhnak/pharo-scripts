StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Open Debugger on the right monitor'
		code: [

GTMoldableDebugger compile: 'initialExtent
"This code was taken from the standard debugger to get the same behavior. Fell free to refactor"

	RealEstateAgent standardWindowExtent y < 400 "a tiny screen" 
		ifTrue: [^ 700@500].
	
	^ [ | w h |
		w := Display width.
		w > 2000 ifTrue: [ w := w // 2 ].
		h := Display height.
		(w - (w // 3)) @ (h - (h // 5)) ]
		on: Error
		do: [ 850@600 ]'.


		]
		runOnce: true.
}
