extends Hand

export var speed: float = 200
export var dir: Vector2

func _enter_tree():
	randomize()
	#Set random x pos in 3 lanes
	var laneWidth = get_viewport_rect().size.x / 3
	position.x = laneWidth * floor(rand_range(1, 4)) - (laneWidth / 2) 
	
	index = floor(rand_range(0,3))
	getHand(index)

func _physics_process(delta):
	move_local_y(speed * delta)
