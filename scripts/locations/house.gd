extends Node2D

var entered = false

var something_scene = preload("res://scenes/Locations/something.tscn")

@onready var restart_button = $RestartButton
@onready var restart_art = $RestartButton/RestartArt

func _ready() -> void:
	QuestManager.start_quest("talk_to_tatay")
	restart_button.visible = false  # hide by default
	restart_art.visible = false

	# check if ending already reached
	check_restart_button()

func _process(delta):
	check_restart_button()

func check_restart_button():
	if QuestManager.is_quest_completed("break_the_news_to_tatay"):
		restart_button.visible = true
		restart_art.visible = true
	
#	after doing something in brgy hall either workssssss
	if QuestManager.is_quest_active("back_to_house"):
		QuestManager.reach_goal("back_to_house")
		QuestManager.finish_quest("back_to_house")
		print("should be done in barangay hall")

func _on_settings_pressed() -> void:
	SceneLoader.load_scene("res://scenes/Menu/SETTINGS.tscn")


func _on_restart_button_pressed() -> void:
	QuestManager.active_quests.clear()
	QuestManager.completed_quests.clear()
	SceneLoader.load_scene("res://scenes/Menu/MAIN MENU.tscn")
