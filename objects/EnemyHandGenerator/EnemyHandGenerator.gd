extends Node

var timer:Timer
var enemyHand = preload("res://objects/EnemyHand/EnemyHand.tscn")
export var speed: float
export var interval: float
export var speedIncrement: float
var enemyHandCount: int
var incrementionCounter: float

func _enter_tree():
	timer = createTimer()
	timer.connect("timeout", self, "onTimeout")

func createTimer(var time: float = 1) -> Timer:
	var timer = Timer.new()
	add_child(timer);
	timer.one_shot = true
	timer.start(time)
	return timer

func onTimeout():
	createEnemyHandInstance()
	enemyHandCount += 1
	
	setNewSpeedValues()
	logValues()
	
	timer.start(interval / speed)

func createEnemyHandInstance():
	var enemyHandInstance = enemyHand.instance()
	enemyHandInstance.speed = speed
	add_child(enemyHandInstance)

func setNewSpeedValues():
	speed += speedIncrement
	incrementionCounter += speedIncrement
	speedIncrement -= speedIncrement / 200
	
	#Each 50 speed incrementation decreases interval by 1%
	if(incrementionCounter > 50):
		interval -= interval / 100
		incrementionCounter = 0

func logValues():
	print(
	self.name, ": ",
	"\t Created: ", enemyHandCount,
	"\t Speed: ", speed,
	"\t Interval: ", interval,
	 "\t Time: ", interval/speed,
	 "\t SIncrement: ", speedIncrement)
