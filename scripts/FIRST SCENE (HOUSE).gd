extends Node2D

@onready var exit_area = $"House to Farm"

func _ready():
	exit_area.visible = false
	exit_area.monitoring = false
	
	$"TATAY NPC/Quest".start_quest()
