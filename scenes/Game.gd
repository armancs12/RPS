extends Node2D

var score: int = 0
var highscore: int = 0

signal score
signal gameLoad
signal gameOver

func _enter_tree():
	for player in $PlayerHands.get_children():
		if player is PlayerHand:
			player.connect('gameOver', self, 'onGameOver')
			player.connect('score', self, 'onScore')
	$UI.connect("gameStart", self, "onGameStart")

func _ready() -> void:
	get_tree().paused = true
	
	$GameSaver.loadGame()
	emit_signal("gameLoad")

func onGameOver():
	if score > highscore:
		highscore = score

	get_tree().paused = true
	$GameSaver.saveGame()
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

func getProps() -> Dictionary:
	return {
		"highscore": highscore
	}

func setProps(props: Dictionary) -> void:
	highscore = props.get("highscore")
