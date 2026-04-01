extends Node2D

@onready var brgy_hall: Button = $"Brgy Hall"
const Balloon = preload("res://dialogue/Balloon/balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func _on_settings_pressed() -> void:
	SceneLoader.load_scene("res://scenes/Menu/SETTINGS.tscn")

func _on_house_pressed() -> void:
	SceneLoader.load_scene("res://scenes/Locations/house.tscn")

func _on_brgy_hall_pressed() -> void:
	print("Pressed!")
	#
	if not QuestManager.is_quest_completed("talk_to_tatay"):
		var balloon = Balloon.instantiate()
		balloon.add_to_group("dialogue_balloon")
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
	else:
		SceneLoader.load_scene("res://scenes/Locations/BRGY HALL.tscn")
