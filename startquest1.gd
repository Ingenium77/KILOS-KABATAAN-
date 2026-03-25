extends Area2D

@export var quest: Quest

func _on_body_entered(body: Node2D) -> void:
	#check for player
	if body.is_in_group("Player"):
		#if quest is available
		if quest.quest_status == quest.QuestStatus.started:
			#start the quest
			quest.start_quest()
			
	#if player has reached goal
		if quest.quest_status == quest.QuestStatus.reached_goal:
			#finish the quest
			quest.finish_quest()
