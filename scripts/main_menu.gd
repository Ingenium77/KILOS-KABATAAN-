extends Control


@export var initial_scene: StringName = &""
@export var play_button: Button


func _on_settings_pressed() -> void:
	SceneLoader.load_scene("res://SETTINGS.tscn")

func _on_play_pressed() -> void:
	SceneLoader.load_scene(initial_scene)
	
func _on_credits_pressed() -> void:
	SceneLoader.load_scene("res://CREDITS.tscn")
	
	
