extends Node

export var key: String

signal changeHand

func _process(delta):
	if Input.is_action_just_pressed(key):
		emit_signal("changeHand")
