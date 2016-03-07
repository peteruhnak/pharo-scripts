StartupPreferencesLoader default executeAtomicItems: {
	"old STHub configuration"
	"
	StartupAction
		name: 'add dynacase configuration and load it.'
		code: [
			(SmalltalkImage current imageName includesSubstring: 'DynaCASE') ifTrue: [
				Gofer new
					repository: (
						MCSmalltalkhubRepository
						owner: 'DynaCASE'
						project: 'DynaCASE'
					);
					package: 'ConfigurationOfDynaCASE';
					load.
				ConfigurationOfDynaCASE loadBleedingEdge.
			]
		]
		runOnce: true.
	"
	"
		StartupAction
			name: 'add dynacase configuration and load it.'
			code: [
				(SmalltalkImage current imageName includesSubstring: 'DynaCASE') ifTrue: [
					[
						Gofer new
							url: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main';
							configurationOf: 'GitFileTree';
							loadDevelopment.

						Metacello new
							baseline: 'DynaCASE';
							repository: 'gitfiletree:///home/peter/prog/dynacase/gitrepo/repository';
							load.
						(MessageDialogWindow new textFont: StandardFonts defaultFont; text: 'loading complete') open
					] fork
				].
			]
			runOnce: true.
	"
}
