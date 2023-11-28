extends Control

func _ready():
	$NewGameButton.connect("pressed", self, "_on_PlayButton_pressed")

func _on_PlayButton_pressed():
	get_tree().change_scene("res://Game.tscn")
