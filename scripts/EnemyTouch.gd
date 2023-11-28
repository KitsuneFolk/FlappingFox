extends Sprite

onready var player: KinematicBody2D = get_node("/root/StaticBody2D/PlayerKinematicBody2D")

func _on_Area2D_body_entered(body:Node):
	if (body.name == player.name):
		show_lost_animation()
		
func show_lost_animation():
	get_tree().paused = true
	OS.delay_msec(500)
	get_tree().change_scene("res://Menu.tscn")
	get_tree().paused = false
