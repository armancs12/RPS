extends Node

var timer:Timer

export var speed: float
export var interval: float
export var speedIncrement: float

var enemyHandCount: int
var incrementionCounter: float

var enemyHand = preload("res://objects/EnemyHand/EnemyHand.tscn")
var xPoses: Array = [96, 288, 480]
var xPosIndexBefore: int
var indexBefore: int

func _enter_tree():
	randomize()
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
	
	# Always instantiate on different x positions
	var xPosIndex = getDifferentValue(xPosIndexBefore, 3)
	enemyHandInstance.position.x = xPoses[xPosIndex]
	xPosIndexBefore = xPosIndex
	
	# With different index as well
	enemyHandInstance.index = getDifferentValue(indexBefore, 3)
	indexBefore = enemyHandInstance.index
	add_child(enemyHandInstance)

func getDifferentValue(var value: float, var inRange: float) -> float:
	var diff = floor(rand_range(0,inRange))
	while diff == value:
		diff = floor(rand_range(0,3))
	return diff

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
