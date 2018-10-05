StartupPreferencesLoader default executeAtomicItems: {

	StartupAction

		name: 'Remove noisy lint rules'

		code: [



#(RBStringConcatenationRule RBCollectionMessagesToExternalObjectRule RBMissingTranslationsInMenusRule RBMethodHasNoTimeStampRule GRTemporaryNeitherReadNorWrittenRule
RBBadMessageRule
OverridesDeprecatedMethodRule
RBUtilityMethodsRule
RBIfTrueReturnsRule) do: [ :each |

	Smalltalk globals at: each ifPresent: #removeFromSystem.

].





ReRuleManager resetWithInform.



		]

		runOnce: true.

}