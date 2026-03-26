extends Node2D

var entered = false

func _ready() -> void:
	QuestManager.start_quest("remove_something")
	print("started remove_something quest")
