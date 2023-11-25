extends StaticBody2D

const GROUND_SCALE = 20.5706
const SPEED = 300
onready var ground1: Sprite = get_node("/root/StaticBody2D/StaticBody2D/CollisionShape2D/Ground1")
onready var ground2: Sprite = get_node("/root/StaticBody2D/StaticBody2D/CollisionShape2D/Ground2")
onready var ground3: Sprite = get_node("/root/StaticBody2D/StaticBody2D/CollisionShape2D/Ground3")
onready var visibilityNotifier1: VisibilityNotifier2D = get_node("/root/StaticBody2D/StaticBody2D/CollisionShape2D/Ground1/VisibilityNotifier2D")
onready var visibilityNotifier2: VisibilityNotifier2D = get_node("/root/StaticBody2D/StaticBody2D/CollisionShape2D/Ground2/VisibilityNotifier2D")
onready var visibilityNotifier3: VisibilityNotifier2D = get_node("/root/StaticBody2D/StaticBody2D/CollisionShape2D/Ground3/VisibilityNotifier2D")
var translation = Vector2.ZERO

func moveGround():
	if (!visibilityNotifier1.is_on_screen()):
		var new_position = ground3.position
		new_position.x += ground3.texture.get_width() * GROUND_SCALE
		ground1.position = new_position
	if (!visibilityNotifier2.is_on_screen()):
		var new_position = ground1.position
		new_position.x += ground1.texture.get_width() * GROUND_SCALE
		ground2.position = new_position
	if (!visibilityNotifier3.is_on_screen()):
		var new_position = ground2.position
		new_position.x += ground2.texture.get_width() * GROUND_SCALE
		ground3.position = new_position

func _ready():
	visibilityNotifier1.connect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")
	visibilityNotifier2.connect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")
	visibilityNotifier3.connect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")

func _process(delta):
	translation.x += -SPEED * delta
	position = translation

func _on_VisibilityNotifier2D_screen_exited():
	moveGround()
	pass # Replace with function body.
