extends Node

var timer:Timer
var enemyHand = preload("res://objects/EnemyHand/EnemyHand.tscn")

func _enter_tree():
	timer = createTimer(2)
	timer.connect("timeout", self, "onTimeout")

func createTimer(var time: float) -> Timer:
	var timer = Timer.new()
	add_child(timer);
	timer.start(time)
	return timer

func onTimeout():
	#Create Enemy Hand object instance
	add_child(enemyHand.instance())
