class_name Quest
extends Resource

enum Status { AVAILABLE, STARTED, REACHED_GOAL, FINISHED }

@export var id: String
@export var title: String
@export_multiline var description: String
@export_multiline var completion_text: String
@export var objectives: Array[QuestObjective]
@export var unlock_areas: Array[String] = []  # Multiple areas
# Chain quest fields
@export var prerequisite_quests: Array[String] 
@export var next_quests: Array[String] 
@export var is_main_quest: bool = true 

var status: Status = Status.AVAILABLE

func is_complete() -> bool:
	for obj in objectives:
		if not obj.is_complete():
			return false
	return true

func get_objective(objective_id: String) -> QuestObjective:
	for obj in objectives:
		if obj.id == objective_id:
			return obj
	return null
