extends Control

var game: Node2D
var backgroundColorIncrement: float = 0.002

func _enter_tree():
	game = self.owner
	game.connect("score", self, "onScore")


func onScore():
	$Background.color.h += backgroundColorIncrement
	print(self.name, ": ", "Background Color: ", $Background.color)
