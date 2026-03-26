extends Node2D

var entered = false

var something_scene = preload("res://scenes/Locations/something.tscn")

func _ready() -> void:
	QuestManager.start_quest("remove_something")
	print("started remove_something quest")

# Something is not needed later so remove this if you get tired of Something
#	makes sure something doesn't spawn again	
	if not QuestManager.is_quest_completed("remove_something"):
		var something = something_scene.instantiate()
		something.position = Vector2 (265.0, 72.0)
		add_child(something)
	
#	after doing something in brgy hall either workssssss
	if QuestManager.is_quest_active("back_to_house"):
		QuestManager.reach_goal("back_to_house")
		QuestManager.finish_quest("back_to_house")
		print("should be done in barangay hall")
