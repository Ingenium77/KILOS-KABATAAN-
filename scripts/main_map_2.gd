extends Node2D


func _on_home_pressed() -> void:
	SceneLoader.load_scene("res://scenes/MAIN MENU.tscn")

func _on_settings_pressed() -> void:
	SceneLoader.load_scene("res://scenes/SETTINGS.tscn")

func _on_house_pressed() -> void:
	SceneLoader.load_scene("res://scenes/aiden test scene.tscn")

func _on_brgy_hall_pressed() -> void:
	SceneLoader.load_scene("res://scenes/BRGY HALL.tscn")
