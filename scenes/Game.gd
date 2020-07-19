extends Node2D

var score: int

func _enter_tree():
	$PlayerHand.connect("gameOver", self, "onGameOver")
	$PlayerHand2.connect("gameOver", self, "onGameOver")
	$PlayerHand3.connect("gameOver", self, "onGameOver")
	
	$PlayerHand.connect("score", self, "onScore")
	$PlayerHand2.connect("score", self, "onScore")
	$PlayerHand3.connect("score", self, "onScore")

func onGameOver():
	get_tree().reload_current_scene()

func onScore():
	score += 1
	print(self.name, ": ", "Score: ", score)
