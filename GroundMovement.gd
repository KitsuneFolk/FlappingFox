extends Node2D

const GROUND_SCALE = 15
const SPEED = 300

onready var player: KinematicBody2D = get_node("/root/StaticBody2D/PlayerKinematicBody2D")
onready var distance_label: Label = get_node("/root/StaticBody2D/Background/Label")
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

var summoned_enemy_time = Time.get_unix_time_from_system()
func _process(delta):
	position.x -= SPEED * delta
	distance_label.text = "DISTANCE: %s" % abs((position.x / 200) as int) 
	if (Time.get_unix_time_from_system() - summoned_enemy_time > rand_range(2, 4)):
		summoned_enemy_time = Time.get_unix_time_from_system()
		summonEnemy(-(position.x + 100))

func _on_VisibilityNotifier2D_screen_exited(id: int):
	moveGround(id)
	pass

func summonEnemy(x: int):
	var new_enemy = $Area2D.duplicate()
	new_enemy.position.x = x
	add_child(new_enemy)
	print("Summoned, x = ", x, "current pos = ", position.x)
