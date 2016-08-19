StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Keep playground print-its on the same line'
		code: [

(RubTextEditor>>#atEndOfLineInsertAndSelect:) ast = (RBParser parseMethod: 'atEndOfLineInsertAndSelect: aString
	self insertAndSelect: aString at: (self encompassParagraph: self selectionInterval) last + 1') ifTrue: [
		
	RubTextEditor compile: 'atEndOfLineInsertAndSelect: aString
	| last lastChar |
	last := (self encompassParagraph: self selectionInterval) last.
	(self textArea text at: last) = Character cr
		ifFalse: [ last := last + 1 ].
	self insertAndSelect: aString at: last'
]		
ifFalse: [
		self error: 'The source code of RubTextEditor>>#atEndOfLineInsertAndSelect: has changed. I will not override it.'
]
		]
		runOnce: true.	
}