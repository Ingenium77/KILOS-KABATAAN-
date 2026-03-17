extends Node2D


@export var initial_scene: StringName = &""
@export var play_button: Button

func _ready() -> void:
	play_button.pressed.connect(_on_button_pressed)


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://SETTINGS.tscn")


func _on_play_pressed() -> void:
	print("PLAY pressed)")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://CREDITS.tscn")
