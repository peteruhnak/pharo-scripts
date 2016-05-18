StartupPreferencesLoader default executeAtomicItems: {

	StartupAction
		name: 'add pharo launcher.'
		code: [
			(SmalltalkImage current shortImageName beginsWith: 'PharoLauncher') ifTrue: [
				[
					Gofer new
						repository: (
							MCSmalltalkhubRepository
							owner: 'Pharo'
							project: 'PharoLauncher'
						);
						package: 'ConfigurationOfPharoLauncher';
						load.
					#ConfigurationOfPharoLauncher asClass loadBleedingEdge.

					#PhLImage asClass
						compile: 'launch: aFullPathString
						"Use the VM that launched the current image to launch me"
						| vmCommand imagePath  |

						vmCommand := aFullPathString isEmpty ifTrue: [Smalltalk vm fullPath asString] ifFalse: [ aFullPathString ] .
						imagePath := file pathString.

						^OSProcess command: vmCommand , '' --textenc UTF-8  "'' , imagePath, ''"''.'
						classified: 'action'.
					(MessageDialogWindow new textFont: StandardFonts defaultFont; text: 'Launcher loaded') open
				] fork.
			]
		]
		runOnce: true.
}
