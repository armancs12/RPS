extends Node2D
class_name Hand

export var index: int

var colors: Array = [
	Color.red,
	Color.blue,
	Color.green
]

func getHand(index: int):
	#TODO: Get Sprite
	$Sprite.modulate = colors[index]
