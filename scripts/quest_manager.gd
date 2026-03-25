class_name QuestManager extends Node2D

#ui elements for quest info to show on screen
@onready var QuestBox: CanvasLayer = $".".get_node("QuestBox")
@onready var QuestTitle: RichTextLabel = $".".get_node("QuestBox").get_node("QuestDescription")
@onready var QuestDescription: RichTextLabel = $".".get_node("QuestBox").get_node("QuestDescription")

@export_group("Quest Settings")
@export var quest_name: String #name of quest
@export var quest_description: String #ui description text
@export var reached_goal_text: String #ui description text after reaching goal

#all quest statuses
enum QuestStatus{
	started,
	reached_goal,
	finished,
}

#quest status
@export var quest_status: QuestStatus = QuestStatus.started
