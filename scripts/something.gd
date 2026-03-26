extends StaticBody2D

func remove_something() -> void:
	print("Trying to finish quest: remove_something")
	print("Active quests: ", QuestManager.active_quests.keys())
	print("Is it active? ", QuestManager.active_quests.has("remove_something"))
	#QuestManager.reach_goal("remove_something")
	#await get_tree().create_timer(2.0).timeout
	QuestManager.finish_quest("remove_something", 2)
	queue_free()

func check_list_something() -> void:
	QuestManager.reach_goal("check_list")
	await get_tree().create_timer(3.0).timeout
	QuestManager.finish_quest("check_list",2)
	QuestManager.start_quest("back_to_house")
	
