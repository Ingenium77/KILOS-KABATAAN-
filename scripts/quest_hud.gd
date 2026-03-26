extends CanvasLayer

@onready var quest_hud: CanvasLayer = $"."
@onready var quest_box: NinePatchRect = $QuestBox
@onready var quest_title: RichTextLabel = $QuestBox/QuestTitle
@onready var quest_description: RichTextLabel = $QuestBox/QuestDescription

# Padding around text inside the box
@export var padding: Vector2 = Vector2(20, 20)
# Spacing between title and description
@export var text_spacing: float = 10

func _ready():
	QuestManager.quest_started.connect(_on_quest_started)
	QuestManager.quest_reached_goal.connect(_on_reached_goal)
	QuestManager.quest_finished.connect(_on_finished)
	quest_hud.hide()

func _on_quest_started(id: String):
	var quest = QuestManager.get_quest(id)
	if not quest:
		return
	
	quest_title.text = quest.title
	quest_description.text = quest.description
	
	update_box_size()
	quest_hud.show()

func _on_reached_goal(id: String):
	var quest = QuestManager.get_quest(id)
	if quest:
		quest_description.text = quest.completion_text
		update_box_size()
		quest_title.modulate = Color.GOLD

func _on_finished(id: String):
	await get_tree().create_timer(2.0).timeout
	quest_hud.hide()
	quest_title.modulate = Color.WHITE

func toggle():
	quest_hud.visible = !quest_hud.visible

func update_box_size():
	# Wait for text to layout
	await get_tree().process_frame
	
	# Get content heights
	var title_height = quest_title.get_content_height()
	var desc_height = quest_description.get_content_height()
	
	# Calculate total height
	var total_height = padding.y + title_height + text_spacing + desc_height + padding.y
	
	# Get current width (keep it fixed, or make it dynamic too)
	var current_width = quest_box.size.x
	
	# Resize the NinePatchRect
	quest_box.size = Vector2(current_width, total_height)
	
	# Position description below title
	quest_description.position.y = padding.y + title_height + text_spacing
