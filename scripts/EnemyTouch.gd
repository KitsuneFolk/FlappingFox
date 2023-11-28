extends Sprite

onready var player: KinematicBody2D = get_node("/root/StaticBody2D/PlayerKinematicBody2D")

func _on_Area2D_body_entered(body:Node):
	if (body.name == player.name):
		get_tree().reload_current_scene()
