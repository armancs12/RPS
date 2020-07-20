extends Control

var game: Node2D
var backgroundColorIncrement: float = 0.002

signal gameStart
signal okayToEndGame

func _enter_tree():
	game = self.owner
	game.connect("score", self, "onScore")
	game.connect("gameOver", self, "onGameOver")


func onScore():
	$Background.color.h += backgroundColorIncrement
	print(self.name, ": ", "Background Color: ", $Background.color)


func _on_PlayButton_pressed():
	$Background/Fade/AnimationPlayer.play_backwards("Fade")
	$StartGameMenu.queue_free()
	emit_signal("gameStart")

func onGameOver():
	print(self.name, ": Begin")
	$Background/Fade/AnimationPlayer.play("Fade")
	yield($Background/Fade/AnimationPlayer, "animation_finished")
	emit_signal("okayToEndGame")
