extends Area2D
class_name Hand

export var index: int
export var skinColor: int
export var sprite: Texture

var sprites: Array = [
	#Rock
	[
		preload("res://assets/sprites/hand/rock/Rock.png"),
		preload("res://assets/sprites/hand/rock/Rock1.png"),
		preload("res://assets/sprites/hand/rock/Rock2.png"),
		preload("res://assets/sprites/hand/rock/Rock3.png")
	],
	#Paper
	[
		preload("res://assets/sprites/hand/paper/Paper.png"),
		preload("res://assets/sprites/hand/paper/Paper1.png"),
		preload("res://assets/sprites/hand/paper/Paper2.png"),
		preload("res://assets/sprites/hand/paper/Paper3.png")
	],
	#Scissors
	[
		preload("res://assets/sprites/hand/scissors/Scissors.png"),
		preload("res://assets/sprites/hand/scissors/Scissors1.png"),
		preload("res://assets/sprites/hand/scissors/Scissors2.png"),
		preload("res://assets/sprites/hand/scissors/Scissors3.png"),
	]
]

func _enter_tree():
	skinColor = floor(rand_range(0,4))

func getHand(index: int):
	$Sprite.texture = sprites[index][skinColor]
