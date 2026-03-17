extends Control


@export var initial_scene: StringName = &""
@export var play_button: Button


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://SETTINGS.tscn")

func _on_play_pressed() -> void:
	SceneLoader.load_scene(initial_scene)
	
func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://CREDITS.tscn")
