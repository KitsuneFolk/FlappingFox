extends Node2D

const GROUND_SCALE = 10
const SPEED = 300
onready var ground1: StaticBody2D = get_node("/root/StaticBody2D/Node2D/Ground1")
onready var ground2: StaticBody2D = get_node("/root/StaticBody2D/Node2D/Ground2")
onready var ground3: StaticBody2D = get_node("/root/StaticBody2D/Node2D/Ground3")
onready var ground1_sprite: Sprite = get_node("/root/StaticBody2D/Node2D/Ground1/CollisionShape2D/Sprite")
onready var ground2_sprite: Sprite = get_node("/root/StaticBody2D/Node2D/Ground2/CollisionShape2D/Sprite")
onready var ground3_sprite: Sprite = get_node("/root/StaticBody2D/Node2D/Ground3/CollisionShape2D/Sprite")
onready var visibilityNotifier1: VisibilityNotifier2D = get_node("/root/StaticBody2D/Node2D/Ground1/CollisionShape2D/VisibilityNotifier2D")
onready var visibilityNotifier2: VisibilityNotifier2D = get_node("/root/StaticBody2D/Node2D/Ground2/CollisionShape2D/VisibilityNotifier2D")
onready var visibilityNotifier3: VisibilityNotifier2D = get_node("/root/StaticBody2D/Node2D/Ground3/CollisionShape2D/VisibilityNotifier2D")

func moveGround(id: int):
	match(id):
		1:
			var new_position = ground3.position
			new_position.x += ground3_sprite.texture.get_width() * GROUND_SCALE
			ground1.position = new_position
		2: 
			var new_position = ground1.position
			new_position.x += ground1_sprite.texture.get_width() * GROUND_SCALE
			ground2.position = new_position
		3: 
			var new_position = ground2.position
			new_position.x += ground2_sprite.texture.get_width() * GROUND_SCALE
			ground3.position = new_position

func _process(delta):
	position.x -= SPEED * delta
	pass

func _on_VisibilityNotifier2D_screen_exited(id: int):
	moveGround(id)
	pass
