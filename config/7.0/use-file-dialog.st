StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Install & use FileDialog'
		code: [

(Smalltalk hasClassNamed: #BaselineOfFileDialog) ifFalse: [
OSPlatform current isWindows
	ifTrue: [
		Metacello new
			baseline: 'FileDialog';
			repository: 'filetree:///D:/prog/file-dialog/repository';
			load.
	] ifFalse: [
		Metacello new
			baseline: 'FileDialog';
			repository: 'filetree:///home/peter/prog/file-dialog/repository';
			load.
	].

	FDMorphicUIManager new beDefault.

	OSPlatform current isWindows
	ifTrue: [
		FDFileDialog addBookmark: FileLocator D asFileReference / 'prog'.
		FDFileDialog addBookmark: FileLocator D asFileReference / 'pharo-prog'.
		FDFileDialog addBookmark: FileLocator D asFileReference / 'OpenPonk' / 'git'.
	] ifFalse: [
		FDFileDialog addBookmark: FileLocator home asFileReference / 'prog'
	]

]

		]
		runOnce: true.
}