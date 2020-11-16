extends Hand
class_name PlayerHand

signal gameOver
signal score

func _enter_tree():
	$ChangeHandRequests.connect("changeHand", self, "onChangeHand")
	$Encounterer.connect("gameOver", self, "onGameOver")
	$Encounterer.connect("score", self, "onScore")
	$Encounterer.connect("draw", self, "onDraw")

func _ready():
	getHand(index)

func onChangeHand():
	$AudioPlayer/Change.play()
	index = (index + 1) % 3 #3 options (Rock, Paper, Scissors)
	getHand(index)

func onGameOver():
	emit_signal("gameOver")

func onScore():
	$AudioPlayer/Win.play()
	emit_signal("score")

func onDraw():
	$AudioPlayer/Draw.play()
