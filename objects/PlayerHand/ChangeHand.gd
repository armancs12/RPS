extends Node

signal changeHand

var player: Node2D

var indexColors: Array = [
	Color.red,
	Color.blue,
	Color.green
]

func _enter_tree():
	player = self.owner
	$TouchInput.connect("changeHand", self, "onChangeHand")
	$KeyInput.connect("changeHand", self, "onChangeHand")

func onChangeHand():
	player.index = (player.index + 1) % 3
	getHand(player.index)

func getHand(index: int):
	player.get_node("Sprite").modulate = indexColors[index]
