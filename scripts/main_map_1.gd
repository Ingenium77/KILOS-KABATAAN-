extends Node2D

@export var initial_scene: StringName = &""
@export var play_button: Button

func _on_go_to_house_pressed() -> void:
	SceneLoader.load_scene("res://scenes/FIRST SCENE (HOUSE).tscn")

func _on_settings_pressed() -> void:
	SceneLoader.load_scene("res://scenes/SETTINGS.tscn")

func _on_home_pressed() -> void:
	SceneLoader.load_scene("res://scenes/MAIN MENU.tscn")
