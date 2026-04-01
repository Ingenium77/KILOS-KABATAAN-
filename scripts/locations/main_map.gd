extends Node2D

@onready var brgy_hall: Button = $"Brgy Hall"

func _ready():
	# Check if already unlocked (in case we return to this scene)
	update_buttons()

func _on_area_unlocked(area_id: String):
	if area_id == "brgy_hall":
		brgy_hall.disabled = false
		brgy_hall.modulate = Color.WHITE  # Normal color
		print("Barangay Hall unlocked!")

func update_buttons():
	# Check if brgy_hall should be unlocked
	brgy_hall.disabled = true
	brgy_hall.modulate = Color.GRAY  # Locked appearance
	
	if QuestManager.is_quest_completed("talk_to_tatay"):
			brgy_hall.disabled = false
			brgy_hall.text = ""
			brgy_hall.modulate = Color.WHITE

func _on_settings_pressed() -> void:
	SceneLoader.load_scene("res://scenes/Menu/SETTINGS.tscn")

func _on_house_pressed() -> void:
	SceneLoader.load_scene("res://scenes/Locations/house.tscn")

func _on_brgy_hall_pressed() -> void:
	SceneLoader.load_scene("res://scenes/Locations/BRGY HALL.tscn")
