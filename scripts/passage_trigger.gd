extends Area2D


@export var required_done_quests: Array[String] = []
@export var require_all_quests: bool = true  # true = AND logic, false = OR logic
@export var required_active_quests: Array[String] = []


@export var target_scene: String = "<Location Here Replace this>"
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "locked"  # Configurable start node

var is_triggered: bool = false

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
	
	if is_triggered:
		return
	
	# Check if ALL required quests are complete
	if are_all_quests_complete():
		SceneLoader.load_scene(target_scene)
		return
	
	# Some quests not complete - STOP PLAYER and show dialogue
	is_triggered = true
	
	# FREEZE PLAYER
	body.set_physics_process(false)
	body.velocity = Vector2.ZERO
	
	# Show dialogue
	if dialogue_resource:
		show_locked_dialogue(body)
	
	else:
		await get_tree().create_timer(1.0).timeout
		release_player(body)

func are_all_quests_complete() -> bool:
	var has_active_reqs = not required_active_quests.is_empty()
	var has_done_reqs = not required_done_quests.is_empty()
	#	Check active quest requirements
	if not has_active_reqs and not has_done_reqs:
		return true
			
	if require_all_quests:
		# AND logic - every quest in both lists must be active or completed
		for quest_id in required_active_quests:
			if not QuestManager.is_quest_active(quest_id) and not QuestManager.is_quest_completed(quest_id):
				return false
		for quest_id in required_done_quests:
			if not QuestManager.is_quest_completed(quest_id):
				return false
		return true
	else:
		# OR logic - at least one from either list passes
		for quest_id in required_active_quests:
			if QuestManager.is_quest_active(quest_id) or QuestManager.is_quest_completed(quest_id):
				return true
		for quest_id in required_done_quests:
			if QuestManager.is_quest_completed(quest_id):
				return true
		return false

func get_incomplete_quests() -> Array[String]:
	if require_all_quests:
		# AND mode: all incomplete ones are "blocking"
		var incomplete: Array[String] = []
		for quest_id in required_done_quests:
			if not QuestManager.is_quest_completed(quest_id):
				incomplete.append(quest_id)
		return incomplete
	else:
		# OR mode: if any quest is done, nothing is blocking
		for quest_id in required_done_quests:
			if QuestManager.is_quest_completed(quest_id):
				return []  # unlocked, no blockers
		return required_done_quests  # none complete, all are "blockers"

func show_locked_dialogue(player: CharacterBody2D) -> void:
	var Balloon = preload("res://dialogue/Balloon/balloon.tscn")
	var balloon = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	
	DialogueManager.dialogue_ended.connect(
		func(_r): release_player(player), 
		CONNECT_ONE_SHOT
	)
	
	balloon.start(dialogue_resource, dialogue_start)

func release_player(player: CharacterBody2D) -> void:
	player.set_physics_process(true)
	is_triggered = false
