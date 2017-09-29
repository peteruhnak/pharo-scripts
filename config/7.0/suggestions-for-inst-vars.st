StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Show suggestions for inst vars in class pane'
		code: [

|newCode|
newCode := 'findSuggestionsFor: context
	"Finds the best suggestions for the context passed as a parameter"

	| node suggestions |
	context selectedMethod
		ifNil: [ node := (RBParser parseExpression: context code) bestNodeFor: context selectedInterval.
			context selectedNode: (RBInstanceVariableNode named: node value).
			suggestions := SugsSuggestionFactory commandsForInstanceVariable.
			suggestions do: [ :each | each context: context ].
			^ suggestions select: [ :each | each isValidForContext ] ].
	context selectedMethod ifNil: [ ^ #() ].	"no support for class pane yet"
	node := self findBestNodeFor: context.
	node ifNil: [ ^ OrderedCollection new ].
	suggestions := node ifNotNil: [ node suggestions ].
	suggestions do: [ :sugg | sugg context: context ].
	^ suggestions select: [ :sugg | sugg isValidForContext ]'.

SugsMenuBuilder class compile: newCode.

		]
		runOnce: true.	
}