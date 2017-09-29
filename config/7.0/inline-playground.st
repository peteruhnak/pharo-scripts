StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Keep playground print-its on the same line'
		code: [

	RubTextEditor compile: 'atEndOfLineInsertAndSelect: aString
	| last lastChar |
	last := (self encompassParagraph: self selectionInterval) last.
	(self textArea text at: last) = Character cr
		ifFalse: [ last := last + 1 ].
	self insertAndSelect: aString at: last'

		]
		runOnce: true.
}
