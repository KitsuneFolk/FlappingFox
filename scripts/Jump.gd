extends KinematicBody2D

const GRAVITY = 1000
const JUMP_FORCE = -600
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_FORCE
