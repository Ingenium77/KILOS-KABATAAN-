extends CharacterBody2D

@export var speed = 400
@onready var sprite = $AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	update_animation()

func update_animation():
	if velocity == Vector2.ZERO:
		sprite.stop()
		return
	
	if abs(velocity.x) > abs(velocity.y):
		if velocity.x > 0:
			sprite.play("right")
		else:
			sprite.play("left")
	else:
		if velocity.y > 0:
			sprite.play("down")
		else:
			sprite.play("up")  

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogues/HOUSE.dialogue"), "start")
