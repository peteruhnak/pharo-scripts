StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Roassal zoomable interaction'
		code: [

(Smalltalk hasClassNamed: #RTAbstractContextInteraction) ifTrue: [

RTAbstractContextInteraction subclass: #RTZoomableViewContextInteraction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Roassal2GT-Glamour-Roassal-Interaction'.

#RTZoomableViewContextInteraction asClass compile: 'initializeElement: aView
	aView @ RTZoomableView'
 classified: 'hooks'.

RTInteractiveViewContext compile: 'interactionsToBeRegistered
	^ Array with: RTSelectableElementsContextInteraction with: RTResizeableViewContextInteraction with: RTZoomableViewContextInteraction'

]
		]
		runOnce: true.	
}