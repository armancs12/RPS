extends Hand

signal gameOver
signal score

func _enter_tree():
	$ChangeHandRequests.connect("changeHand", self, "onChangeHand")
	$Encounterer.connect("gameOver", self, "onGameOver")
	$Encounterer.connect("score", self, "onScore")

func _ready():
	getHand(index)

func onChangeHand():
	index = (index + 1) % 3 #3 options (Rock, Paper, Scissors)
	getHand(index)

func onGameOver():
	emit_signal("gameOver")

func onScore():
	emit_signal("score")
