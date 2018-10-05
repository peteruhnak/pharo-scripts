StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Iceberg recursive revert'
		code: [

(IceRepository respondsTo: #shareRepositoriesBetweenImages:) ifTrue: [

|tonelPatch|
tonelPatch := '{ #category : #building }
IceDiffChangeTreeBuilder>> buildOn: aPresenter [
	^ aPresenter fastTree
		allExpanded;
		children: #elements;
		icon: #icon;
		format: #description;
		display: [ self elements ];
		updateOn: IceChangeSetChanged from: #announcer;
		addAction: self refreshTreeAction;
		addSelectionAction: self browseAction;
		addSelectionAction: self browseReferencesAction;
		addSelectionAction: self revertChangeAction;
		addSelectionAction: self revertChangesRecursivelyAction;
		onChangeOfPort: #entity act: [ :presentation | 
			self diff ifNotNil: [  
				self diff announcer 
					when: IceChangeSetChanged 
					send: #execute:
					to: (IceChangesTreeResetSelectionHelper for: presentation) ] ];
		yourself
]

{ #category : #actions }
IceDiffChangeTreeBuilder >> revertChangesRecursivelyAction [
	^ GLMGenericAction new
		action: [ :presentation | self entity revertAllChanges: presentation selection ];
		condition: [ self entity canRevertChanges ];
		icon: #glamorousUndo asIcon;
		title: ''Revert changes recursively''; 
		showTitle
]

{ #category : #building }
IceDiffCherryPickChangeTreeBuilder >> buildOn: aPresenter [
	^ aPresenter cherryPickTree
		allExpanded;
		children: #elements;
		icon: #icon;
		format: #description;
		display: [ self elements ];
		allSelected;
		onChangeOfCherryPick: [ :presentation | self selectedCherryPick: presentation cherryPick ];
		updateOn: IceChangeSetChanged from: #announcer;
		addAction: self refreshTreeAction;
		addSelectionAction: self browseAction;
		addSelectionAction: self browseReferencesAction;
		addSelectionAction: self revertChangeAction;
		addSelectionAction: self revertChangesRecursivelyAction;
		onChangeOfPort: #entity act: [ :presentation | 
			self diff ifNotNil: [
				self diff announcer 
					when: IceChangeSetChanged
					send: #execute:
					to: (IceChangesTreeResetSelectionHelper for: presentation) ] ];
		yourself
]

{ #category : #actions }
IceDiff >> revertAllChanges: anIceChange [
	self myVersion revertAllChanges: anIceChange.
	self refresh
]

{ #category : #actions }
IceWorkingCopy >> revertAllChanges: anIceChange [
	| loader |
	loader := MCPackageLoader new.
	self revertAllChanges: anIceChange loader: loader.
	loader load 
]

{ #category : #actions }
IceWorkingCopy >> revertAllChanges: anIceChange loader: aLoader [
	anIceChange operation ifNotNil: [ :operation | operation inverse applyTo: aLoader ].
	anIceChange elements do: [ :each | self revertAllChanges: each loader: aLoader ] 
]

{ #category : #actions }
IceWorkingCopy >> revertChange: anIceChange [
	| loader |
	loader := MCPackageLoader new.
	anIceChange operation ifNotNil: [ :operation | operation inverse applyTo: loader ].
	loader load
]'.

"
(MCSnapshot fromDefinitions: (TonelParser2 parseStream: tonelPatch readStream)) install
"
]

		]
		runOnce: true.
}
