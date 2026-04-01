extends Node2D

var entered = false

var something_scene = preload("res://scenes/Locations/something.tscn")

func _ready() -> void:
	QuestManager.start_quest("talk_to_tatay")

	
#	after doing something in brgy hall either workssssss
	if QuestManager.is_quest_active("back_to_house"):
		QuestManager.reach_goal("back_to_house")
		QuestManager.finish_quest("back_to_house")
		print("should be done in barangay hall")

func _on_settings_pressed() -> void:
	SceneLoader.load_scene("res://scenes/Menu/SETTINGS.tscn")
