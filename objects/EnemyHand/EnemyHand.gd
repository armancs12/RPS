extends Hand

export var speed: float = 200

var enemyHandParticle = preload("res://objects/EnemyHand/EnemyHandParticle.tscn")

func _enter_tree():
	getHand(index)
	var enemyHandParticleInstance = enemyHandParticle.instance()
	enemyHandParticleInstance.texture = $Sprite.texture
	add_child(enemyHandParticleInstance)

func _physics_process(delta):
	move_local_y(speed * delta)
