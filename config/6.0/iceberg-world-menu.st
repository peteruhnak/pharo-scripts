StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Move the world entry to main menu'
		code: [

(Smalltalk hasClassNamed: #IceRepositoriesBrowser) ifTrue: [

IceRepositoriesBrowser class compile: 'menuCommandOn: aBuilder
	"Add a custom menu item to the world menu"

	<worldMenu>
	(aBuilder item: #Iceberg)
		icon: self icon;
		parent: #MostUsedTools;
		action: [ self open ]'.

]

		]
		runOnce: true.	
}