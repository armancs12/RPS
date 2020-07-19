extends Node

signal changeHand

func _enter_tree():
	for child in get_children():
		child.connect("changeHand", self, "onChangeHand")

func onChangeHand():
	emit_signal("changeHand")
