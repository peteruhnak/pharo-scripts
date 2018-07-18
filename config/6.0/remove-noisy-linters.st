StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Remove noisy lint rules'
		code: [

#(RBStringConcatenationRule RBCollectionMessagesToExternalObjectRule RBMissingTranslationsInMenusRule) do: [ :each |
	Smalltalk globals at: each ifPresent: #removeFromSystem.
].


ReRuleManager resetWithInform.

		]
		runOnce: true.
}