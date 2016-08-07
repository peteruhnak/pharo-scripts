StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'add dynacase configuration and load it.'
		code: [
			true & (SmalltalkImage current shortImageName includesSubstring: 'DynaCASE') ifTrue: [				(UIManager default proceed: 'Load DynaCASE via gitfiletree?') ifTrue: [					[						"GitFileTree"
						Gofer new
							url: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main';
							configurationOf: 'GitFileTree';
							loadDevelopment.						"Lock file dialog, because it's preloaded"						Metacello new							baseline: 'FileDialog';							repository: 'filetree:///home/peter/prog/file-dialog/repository';							lock.						"DynaCASE MetaModel"						Metacello new							baseline: 'DynaCASEModel';							repository: 'gitfiletree:///home/peter/prog/dynacase/git/dynacase-model/repository';							lock.						"DynaCASE"						Metacello new							baseline: 'DynaCASE';							repository: 'gitfiletree:///home/peter/prog/dynacase/git/dynacase/repository';							lock.						"BORM Model"						Metacello new							baseline: 'BormModel';							repository: 'gitfiletree:///home/peter/prog/dynacase/git/borm-model/repository';							lock.													"BORM Persistence"						Metacello new							baseline: 'BormModel';							repository: 'gitfiletree:///home/peter/prog/dynacase/git/borm-model/repository';							lock.						"FSM Editor"						Metacello new							baseline: 'FsmEditor';							repository: 'gitfiletree:///home/peter/prog/dynacase/git/fsm-editor/repository';							onWarningLog;							load.						"BORM Editor"						Metacello new							baseline: 'BormEditor';							repository: 'gitfiletree:///home/peter/prog/dynacase/git/borm-editor/repository';							onWarningLog;							load.														"UML Class Diagram Editor"						Metacello new							baseline: 'ClassEditor';							repository: 'gitfiletree:///home/peter/prog/dynacase/git/class-editor/repository';							onWarningLog;							load.												"DEMO Editor"						Metacello new							baseline: 'DemoEditor';							repository: 'gitfiletree:///home/peter/prog/dynacase/git/demo-editor/repository';							onWarningLog;							load.												"=== Roassal presentations ==="						"Gofer new 							smalltalkhubUser: 'Moose' project: 'GToolkit';							package: 'GT-InspectorExtensions-CoreRoassal';							load.						Gofer new 							smalltalkhubUser: 'Moose' project: 'Glamour';							package: 'Glamour-Tools';							package: 'Glamour-Roassal2-Presentations';							load."							
						UIManager default message: 'Loading complete'
					] fork				]
			].
		]
		runOnce: true.
}
