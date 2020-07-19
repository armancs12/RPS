extends Hand

export var speed: float = 200

func _enter_tree():
	getHand(index)

func _physics_process(delta):
	move_local_y(speed * delta)
