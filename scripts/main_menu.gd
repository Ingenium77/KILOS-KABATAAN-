extends Control


@export var initial_scene: StringName = &""
@export var play_button: Button


func _on_settings_pressed() -> void:
	SceneLoader.load_scene("res://scenes/SETTINGS.tscn")

func _on_play_pressed() -> void:
	SceneLoader.load_scene("res://scenes/MAIN MAP 1.tscn")
	
func _on_credits_pressed() -> void:
	SceneLoader.load_scene("res://scenes/CREDITS.tscn")
	
	
