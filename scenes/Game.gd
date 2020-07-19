extends Node2D

func _enter_tree():
	$PlayerHand.connect("gameOver", self, "onGameOver")
	$PlayerHand2.connect("gameOver", self, "onGameOver")
	$PlayerHand3.connect("gameOver", self, "onGameOver")

func onGameOver():
	get_tree().reload_current_scene()
