extends Control

func _ready():
	$NewGameButton.connect("pressed", self, "_on_PlayButton_pressed")
	$ExitButton.connect("pressed", self, "_on_ExitButton_pressed")

func _on_PlayButton_pressed():
	get_tree().change_scene("res://Game.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
