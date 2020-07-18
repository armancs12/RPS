extends Hand

func _ready():
	getHand(index)

func changeHand():
	index = (index + 1) % 3 #3 options (Rock, Paper, Scissors)
	getHand(index)
