class_name Quest extends QuestManager

#start the quest
func start_quest() -> void:
	# make sure this quest is updated to start
	if quest_status == QuestStatus.started:
		$QuestBox.visible = true
		QuestTitle.text = quest_name
		QuestDescription.text = quest_description
		
#mark quest as completed
func completed() -> void:
	if quest_status == QuestStatus.started:
		#update quest status
		quest_status = QuestStatus.reached_goal
		#update uid
		QuestDescription.text = reached_goal_text
		
# finish the quest
func finish_quest() -> void:
	if quest_status == QuestStatus.reached_goal:
		#update quest status
		quest_status = QuestStatus.finished
		#update ui
		$QuestBox.visible = false
