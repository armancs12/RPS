extends Node2D

var score: int
signal score
signal gameOver

func _enter_tree():
	$PlayerHand.connect("gameOver", self, "onGameOver")
	$PlayerHand2.connect("gameOver", self, "onGameOver")
	$PlayerHand3.connect("gameOver", self, "onGameOver")
	
	$PlayerHand.connect("score", self, "onScore")
	$PlayerHand2.connect("score", self, "onScore")
	$PlayerHand3.connect("score", self, "onScore")

	$UI.connect("gameStart", self, "onGameStart")
	get_tree().paused = true

func onGameOver():
	get_tree().paused = true
	emit_signal("gameOver")
	yield($UI, "okayToEndGame")
	get_tree().reload_current_scene()


func onScore():
	score += 1
	print(self.name, ": ", "Score: ", score)
	emit_signal("score")

func onGameStart():
	print(self.name, ": ", "Game Started!")
	get_tree().paused = false
