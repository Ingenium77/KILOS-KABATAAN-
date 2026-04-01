extends Node2D

func _ready() -> void:
	QuestHud.show()
	QuestManager.reach_goal("go_to_brgy_hall")
	await get_tree().create_timer(3.0).timeout
	QuestManager.finish_quest("go_to_brgy_hall")
	QuestManager.start_quest("check_list")
	
func _on_settings_pressed() -> void:
	SceneLoader.load_scene("res://scenes/Menu/SETTINGS.tscn")
	
