class_name QuestObjective
extends Resource

@export var id: String
@export var description: String
@export var target: int = 1

var current: int = 0

func is_complete() -> bool:
	return current >= target
