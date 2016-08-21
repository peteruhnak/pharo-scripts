StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'add OpenPonk configuration and load it.'
		code: [


((SmalltalkImage current shortImageName includesSubstring: 'OpenPonk') and: [ UIManager default proceed: 'Load OpenPonk via gitfiletree?' ]) ifTrue: [ [ |base|

base := 'gitfiletree:///home/peter/prog/openponk/git/'.

"GitFileTree"
Gofer new
	url: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main';
	configurationOf: 'GitFileTree';
	loadDevelopment.

"Lock file dialog, because it's preloaded"
Metacello new
	baseline: 'FileDialog';
	repository: 'filetree:///home/peter/prog/file-dialog/repository';
	lock.


"OpenPonk MetaModel"
Metacello new
	baseline: 'OpenPonkModel';
	repository: base , 'openponk-model/repository';
	lock.

"OpenPonk"
Metacello new
	baseline: 'OpenPonk';
	repository: base , 'openponk/repository';
	lock.

"BORM Model"
Metacello new
	baseline: 'BormModel';
	repository: base , 'borm-model/repository';
	lock.

"FSM Editor"
Metacello new
	baseline: 'FsmEditor';
	repository: base , 'fsm-editor/repository';
	onWarningLog;
	load.

"BORM Editor"
Metacello new
	baseline: 'BormEditor';
	repository: base , 'borm-editor/repository';
	onWarningLog;
	load.

"UML Class Diagram Editor"
Metacello new
	baseline: 'ClassEditor';
	repository: base , 'class-editor/repository';
	onWarningLog;
	load.

"DEMO Editor"
Metacello new
	baseline: 'DemoEditor';
	repository: base , 'demo-editor/repository';
	onWarningLog;
	load.

UIManager default message: 'Loading complete'

] fork ]
		]
		runOnce: true.
}