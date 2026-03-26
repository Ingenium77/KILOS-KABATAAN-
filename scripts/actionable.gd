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

var is_acting: bool = false  # Prevent double triggers

func action() -> void:
	if is_acting:
		return
	
	is_acting = true
	
	# Show dialogue if enabled and available (before planting starts)
	if use_dialogue and dialogue_resource:
		start_dialogue()
		return
	
	# No dialogue - do action immediately
	do_parent_action()

func no_action() -> void:
	start_dialogue()

func start_dialogue() -> void:
	var balloon = Balloon.instantiate()
	balloon.add_to_group("dialogue_balloon")
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)

func do_parent_action() -> void:
	var parent = get_parent()
	if not parent:
		is_acting = false
		return
	
	if parent.has_method("remove_something"):
		parent.remove_something()
		is_acting = false
		return
	
	is_acting = false  # Reset if nothing happened
