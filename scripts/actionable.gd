@tool
extends Area2D

const Balloon = preload("res://dialogue/Balloon/balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

@export var use_dialogue: bool = true:
	set(v):
		use_dialogue = v
		notify_property_list_changed()
		
func _validate_property(property: Dictionary) -> void:
	if !use_dialogue:
		if property.name in ["dialogue_resource", "dialogue_start"]:
			property.usage = PROPERTY_USAGE_NO_EDITOR

var dialogue_active: bool = false

func action() -> void:
	if dialogue_active:
		return
	
	if use_dialogue and dialogue_resource:
		start_dialogue()
		return
	
	do_parent_action()

func start_dialogue() -> void:
	dialogue_active = true  # Lock only dialogue
	var balloon = Balloon.instantiate()
	balloon.add_to_group("dialogue_balloon")
	get_tree().current_scene.add_child(balloon)
	DialogueManager.dialogue_ended.connect(
		func(_r): dialogue_active = false, 
		CONNECT_ONE_SHOT
	)
	balloon.start(dialogue_resource, dialogue_start)

func do_parent_action() -> void:
	var parent = get_parent()
	if not parent:
		return
	
	if parent.has_method("remove_something"):
		parent.remove_something()
	
