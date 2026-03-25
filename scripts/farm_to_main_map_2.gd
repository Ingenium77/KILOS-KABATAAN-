extends Area2D

var entered = false

func _on_body_entered(body: PhysicsBody2D):
	if body.is_in_group("Player"):
		entered = true

func _on_body_exited(body: PhysicsBody2D):
	if body.is_in_group("Player"):
		entered = false

func _process(delta):
	if entered:
		SceneLoader.load_scene("res://scenes/MAIN MAP 2.tscn")
