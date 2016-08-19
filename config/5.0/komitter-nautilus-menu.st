StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Add entry to Nautilus package menu to use Komitter'
		code: [

|remotesCode code|
"Workaround for Pharo 5 https://pharo.fogbugz.com/f/cases/18927/Komitter-throws-up-if-it-has-committed-everything"
remotesCode := 'remotes
	| result |
	
	self packages ifEmpty: [ ^ #() ].
	
	result := self packages first remotes.
	self packages allButFirst do: [ :each |
		result := result intersection: each remotes ].
	
	^ result collect: [ :each | each koRemote ]'.

KomitStagingArea compile: remotesCode.

code := 'packagesMenu: aBuilder
	<nautilusGlobalPackageMenu>
	| packageNames target |
	target := aBuilder model.
	(packageNames := target selectedPackages collect: #name) ifEmpty: [ ^ target ].
	(aBuilder item: #''Commit with Komitter...'')
		action: [
			Komitter openAndCommitToMonticelloWorkingCopiesFilteredBy: [ :workingCopy |
				packageNames includes: workingCopy package name ] ];
		order: 1295;
		help: ''Open a Komitter on the selected package(s)'';
		icon: Komitter taskbarIcon'.

Komitter class compile: code classified: '*MyKomitter-menu'.

		]
		runOnce: true.	
}