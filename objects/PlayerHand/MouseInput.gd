extends Node

signal changeHand

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			emit_signal("changeHand")
