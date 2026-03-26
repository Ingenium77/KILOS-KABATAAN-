extends StaticBody2D

func remove_something() -> void:
	print("Trying to finish quest: remove_something")
	print("Active quests: ", QuestManager.active_quests.keys())
	print("Is it active? ", QuestManager.active_quests.has("remove_something"))
	QuestManager.finish_quest("remove_something", 1)
	queue_free()
