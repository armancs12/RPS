extends Hand

signal gameOver

func _enter_tree():
	connect("gameOver", self.owner, "gameOver")

func _ready():
	getHand(index)

func changeHand():
	index = (index + 1) % 3 #3 options (Rock, Paper, Scissors)
	getHand(index)

func gameOver():
	emit_signal("gameOver")
