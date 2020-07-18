extends Hand

export var speed: float
export var dir: Vector2

func _enter_tree():
	index = floor(rand_range(0,3))

func _physics_process(delta):
	move_local_y(speed * delta)
