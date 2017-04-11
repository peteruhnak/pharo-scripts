StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Remove Focus From Code Pane on ctrl+shift+t'
		code: [

RubTextEditor class compile: 'buildRemoveFocusShortcutsOn: aBuilder
	<keymap>
	(aBuilder shortcut: #takeKeyboardFocus)
		category: RubTextEditor name
		default: $u ctrl shift win
		do:
			[ :target | "owner... to NautilusWindow" target owner owner owner owner owner owner takeKeyboardFocus ]
		description: ''Remove Keyboard Focus''' classified: '*PersonalStartup'.

AbstractNautilusUI class compile: 'buildGotoSourceShortcutsOn: aBuilder
	<keymap>
	(aBuilder shortcut: #jumpToSourceCode)
		category: #NautilusGlobalShortcuts
		default: $g meta , $s meta
		do: [ :target | target giveFocusToSourceCodeArea ]
		description: ''Jump to the selected method''''s code''' classified: '*PersonalStartup'.


		]
		runOnce: true.
}