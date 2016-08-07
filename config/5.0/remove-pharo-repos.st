StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'remove references to Pharo50 and Pharo50Inbox'
		code: [|rx group|rx := '([0-9]{5})' asRegex.(rx matchesPrefix: Smalltalk image shortImageName) ifFalse: [	group := MCRepositoryGroup default.	group repositories detect: [ :each |		each location includesSubstring: 'Pharo/Pharo50Inbox/main'	] ifFound: [ :repo |		group removeRepository: repo	].	"This repo is added twice for whatever reason (once main and once main/ or whatever."	group repositories detect: [ :each |		each location includesSubstring: 'Pharo/Pharo50/main'	] ifFound: [ :repo |		group removeRepository: repo	].	group repositories detect: [ :each |		each location includesSubstring: 'Pharo/Pharo50/main'	] ifFound: [ :repo |		group removeRepository: repo	]]
		]
		runOnce: true.
}