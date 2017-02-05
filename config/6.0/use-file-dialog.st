StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Install & use FileDialog'
		code: [

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
		FDFileDialog addBookmark: FileLocator D asFileReference / 'prog'
	] ifFalse: [
		FDFileDialog addBookmark: FileLocator home asFileReference / 'prog'
	]

		]
		runOnce: true.
}
