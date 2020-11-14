extends Control

var game: Node2D
var backgroundColorIncrement: float = 0.002

signal gameStart
signal okayToEndGame

func _enter_tree():
	game = self.owner
	game.connect("score", self, "onScore")
	game.connect("gameOver", self, "onGameOver")

func _ready() -> void:
	yield(game, "gameLoad")
	$StartGameMenu/Info/HighScore.text = "Highscore: %d" % game.highscore

func onScore():
	$Score.text = str(game.score)
	$Background.color.h += backgroundColorIncrement
	print(self.name, ": ", "Background Color: ", $Background.color)


func _on_PlayButton_pressed():
	$Background/Fade/AnimationPlayer.play_backwards("Fade")
	$StartGameMenu.queue_free()
	$Score.visible = true
	emit_signal("gameStart")

func onGameOver():
	print(self.name, ": Begin")
	$Background/Fade/AnimationPlayer.play("Fade")
	yield($Background/Fade/AnimationPlayer, "animation_finished")
	emit_signal("okayToEndGame")

func getProps() -> Dictionary:
	return {
		"bgColor": {
			"r" : $Background.color.r,
			"g" : $Background.color.g,
			"b" : $Background.color.b,
		}
	}

func setProps(props: Dictionary) -> void:
	var bgColor: Dictionary = props.get("bgColor")
	$Background.color.r = bgColor.get("r")
	$Background.color.g = bgColor.get("g")
	$Background.color.b = bgColor.get("b")
