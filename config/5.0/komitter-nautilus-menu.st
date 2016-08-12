StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Template'
		code: [|code|code := 'packagesMenu: aBuilder	<nautilusGlobalPackageMenu>	| packageNames target |	target := aBuilder model.	(packageNames := target selectedPackages collect: #name) ifEmpty: [ ^ target ].	(aBuilder item: #''Commit with Komitter...'')		action: [			Komitter openAndCommitToMonticelloWorkingCopiesFilteredBy: [ :workingCopy |				packageNames includes: workingCopy package name ] ];		order: 1295;		help: ''Open a Komitter on the selected package(s)'';		icon: Komitter taskbarIcon'.Komitter class compile: code classified: '*MyKomitter-menu'.		]
		runOnce: true.	
}