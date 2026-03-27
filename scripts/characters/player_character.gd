extends CharacterBody2D

@export var SPEED = 400
@onready var sprite = $AnimatedSprite2D
@onready var direction: Marker2D = $Direction
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

var input_vector: Vector2 = Vector2.ZERO

func _physics_process(delta):
	move_and_slide()
	update_animation()


func update_animation():
	if input_vector == Vector2.ZERO:
		sprite.stop()
		return
	
	if abs(input_vector.x) > abs(input_vector.y):
		if input_vector.x > 0:
			sprite.play("right")
			direction.rotation = -PI / 2  # Right (-90°)
			
		else:
			sprite.play("left")
			direction.rotation = PI / 2  # Left (90°)
			
	else:
		if input_vector.y > 0:
			sprite.play("down")
			direction.rotation = 0  # Down (0°)
		
		else:
			sprite.play("up")  
			direction.rotation = PI  # Up (180°)
			

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			get_viewport().set_input_as_handled()
		
	var x_axis = Input.get_axis("left", "right")
	var y_axis = Input.get_axis("up", "down")
	input_vector = Vector2(x_axis, y_axis).normalized()

	if input_vector.length() > 0:
		velocity = input_vector * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)


func _input(event):
	if event.is_action_pressed("quest_log"):
		QuestHud.toggle()
