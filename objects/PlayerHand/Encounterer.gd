extends Node

var player: Hand

signal gameOver

enum RESULT {
	lost = 0,
	draw,
	win
}

func _enter_tree():
	player = self.owner
	connect("gameOver", player, "gameOver")

func _on_PlayerHand_area_entered(area):
	if typeof(area) == typeof(Hand):
		if !checkThrow(player, area):
			print("lost!")
			emit_signal("gameOver")

func checkThrow(var hand1: Hand, var hand2: Hand) -> int:
	if hand1.index == (hand2.index + 1) % 3:
		return RESULT.win
	elif hand1.index == hand2.index:
		return RESULT.draw
	else:
		return RESULT.lost
