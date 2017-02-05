StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Open Spotter on the right monitor'
		code: [

GTSpotterGlobalShortcut class compile: 'openGlobalSpotter
	| spotterModel width center|
		
	self reset.
	spotterModel := GTSpotter new.
	(Smalltalk hasClassNamed: #GTSpotterEventCollector) ifTrue: [ 
		#GTSpotterEventCollector asClass new
			perform: #occupant: with: spotterModel;
			perform: #category: with: #spotter;
			register;
			perform: #linkToSpotter: with: spotterModel;
			perform: #recordSpotterOpenEvent ].
	
	width := World width / 2.4.
	center := World clearArea center.
	World width > 2000 ifTrue: [ 
		width := width / 2.
		center := center * (1.5@1).
	].
	
	GTSpotterMorph new
		extent: (width @ (World height / 1.6)) asIntegerPoint;
		spotterModel: spotterModel;
		doLayout;
		fullBounds;
		openInWorld;
		center: center.
		
	spotterModel class markOpened.'.

		]
		runOnce: true.
}