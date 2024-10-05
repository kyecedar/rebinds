# Under the TWUDLv1 license.
# https://github.com/kyecedar/rebinds

@tool
extends EditorPlugin
class_name Rebind

static var defaults : Array[Preset] = [] ## Presets that ship with the game.
static var presets  : Array[Preset] = [] ## Presets that evolve with the player.
static var current_preset  : Preset = null
static var bind_map   : Array[Bind] = [] ## Map of all the binds in the game. If a preset has a bind that shouldn't be in, then it doesn't apply it.

static var solidify_ms : int = 150 ## How long it takes for an action to solidify.

static var holds     : Array[String] = [] ## Hold. Overrides singles.
static var singles   : Array[String] = [] ## Single-presses. If has a hold, activate on release or transition to holding when past the solidify delay period.
static var doubles   : Array[String] = [] ## Double-presses.
static var triples   : Array[String] = [] ## Triple-presses.
static var tap_holds : Array[String] = [] ## Tap-holds. (Tap on first keypress, hold on second)

class Bind:
	var kbm : Array[String] ## Keyboard and mouse.
	var ctrl : Array[String] ## Controller.
	
	## Apply the keybind within the game. Adds to [member Rebind.holds], [member Rebind.singles], [member Rebind.doubles], [member Rebind.triples], and [member Rebind.tap_holds].
	func apply() -> void:
		pass

class BindAction:
	pass

## Pre-set keybind configuration. Current keybind config is stored in a preset with an action history.
class Preset:
	var binds : Array[Bind]
	var history : Array[BindAction]
	
	func _init() -> void:
		pass

static func applyPreset() -> void:
	pass

## Whenever a bind, a rebind, or a debind happens, add it to the action history.
static func addAction() -> void:
	pass

static func importPreset() -> void:
	pass

static func exportPreset() -> void:
	pass
