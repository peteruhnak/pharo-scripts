StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Add entry to Nautilus package menu to open Icerberg on the package'
		code: [

IceGlamourSynchronizer class compile: 'packagesMenu: aBuilder
	<nautilusGlobalPackageMenu>
	| target packageName iceRepository |
	target := aBuilder model.
	target selectedPackages ifEmpty: [ ^ target ].
	packageName := target selectedPackages first packageName.
	iceRepository := IceRepository registry
		detect: [ :repo | repo savedPackages anySatisfy: [ :pkg | pkg name = packageName ] ]
		ifNone: [ ^ target ].
	(aBuilder item: #''Open Iceberg...'')
		action: [ self synchronize: iceRepository ];
		order: 1294;
		help: ''Open an Iceberg synchronizer on the first selected package'';
		icon: IceRepositoriesBrowser icon' classified: 'menu'


		]
		runOnce: true.	
}