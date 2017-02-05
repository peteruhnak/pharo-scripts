StartupPreferencesLoader default executeAtomicItems: {
	StartupAction
		name: 'Change debugger labels & shortcuts to use meta+shift+<first letter>'
		code: [

"I need to use Text, not String (to have underlined shortcut letter)"
GLMMorphicActionRenderer compile: (
	(GLMMorphicActionRenderer>>#render:) sourceCode
		copyReplaceAll: 'setBalloonText: (anAction title'
		with: 'setBalloonText: (anAction title asString'
).

RestartDebugAction compile: 'defaultLabel
	^ ''Restart'' asText addAttribute: TextEmphasis underlined from: 1 to: 1'.
PharoShortcuts compile: 'restartExecutionShortcut
	^ $r meta shift'.

ResumeDebugAction compile: 'defaultLabel
	^ ''Proceed'' asText addAttribute: TextEmphasis underlined from: 1 to: 1'.
PharoShortcuts compile: 'resumeExecutionShortcut
	^ $p meta shift'.

StepIntoDebugAction compile: 'defaultLabel
	^ ''Into'' asText addAttribute: TextEmphasis underlined from: 1 to: 1'.
PharoShortcuts compile: 'stepIntoShortcut
	^ $i meta shift'.

StepOverDebugAction compile: 'defaultLabel
	^ ''Over'' asText addAttribute: TextEmphasis underlined from: 1 to: 1'.
"already $o meta shift"

StepThroughDebugAction compile: 'defaultLabel
	^ ''Through'' asText addAttribute: TextEmphasis underlined from: 1 to: 1'.
"already $t meta shift".

		]
		runOnce: true.
}
