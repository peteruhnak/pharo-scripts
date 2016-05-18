StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'issue verifying setup'
		code: [
			|rx verifyImage|			rx := '([0-9]{5}) - verify' asRegex.			verifyImage := rx matchesPrefix: Smalltalk image shortImageName.			verifyImage ifTrue: [				|repo insp issueNumber|				issueNumber := rx subexpression: 2.				repo := MCRepositoryGroup default repositories detect: [ :each |					each location includesSubstring: 'Pharo50Inbox'				].				insp := (MCFileRepositoryInspector repository: repo workingCopy: nil)					show;					yourself.				insp packageSearchField content: 'Slice-Issue-' , issueNumber.			]
		]
		runOnce: true.
}
