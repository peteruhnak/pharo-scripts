StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Add live groups'
		code: [

(SmalltalkImage current shortImageName includesSubstring: 'OpenPonk') ifTrue: [

|holder group nsp openponk live|
(Smalltalk hasClassNamed: #PatternPackageGroup) ifFalse: [

(StartupPreferencesLoader preferencesVersionFolder / 'PatternPackageGroup.st') fileIn.
].


holder := Smalltalk tools browser groupsManager.
group := PatternPackageGroup named: 'UML' pattern: 'UML-'.
(holder includesAGroupNamed: group name)
	ifFalse: [ holder addAGroup: group ].

nsp := PatternPackageGroup named: 'NSP' pattern: 'NSP-'.
(holder includesAGroupNamed: nsp name)
	ifFalse: [ holder addAGroup: nsp ].

openponk := PatternPackageGroup named: 'OpenPonk' pattern: 'OpenPonk-'.
(holder includesAGroupNamed: openponk name)
	ifFalse: [ holder addAGroup: openponk ].

]


		]
		runOnce: true.
}
