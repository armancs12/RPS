extends Node

signal changeHand

var player: Node2D

func _enter_tree():
	player = self.owner
	connect("changeHand", player, "changeHand")
	for child in get_children():
		child.connect("changeHand", self, "onChangeHand")

func onChangeHand():
	emit_signal("changeHand")
