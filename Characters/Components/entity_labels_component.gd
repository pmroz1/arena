# LabelComponent.gd
extends Node3D

class_name EntityLabelsComponent

# Exported references to Label3D nodes
@onready var name_label: Label3D = $Name
@onready var level_label: Label3D =$Name/Level
@onready var attributes = $"../AttributesComponent"

@export var entityBody: Node3D
@export var height_offset : float = 2.0

func move_labels_above_entity(heightOverride: int = -1) -> void:
	# if heightOverride is not null, use it as the height offset
	if heightOverride != -1:
		height_offset = heightOverride

	if entityBody:
		var entity_global_position = entityBody.global_transform.origin
		var label_position = entity_global_position + Vector3(0, height_offset, 0)
		name_label.global_transform.origin = label_position


func getCharacterTypeColor():
	# player, npc, enemy, boss, special
	match attributes.entityType:
		"player":
			return Color(0, 1, 0)
		"npc":
			return Color(0, 0, 1)
		"enemy":
			return Color(1, 0, 0)
		"boss":
			return Color(1, 0, 1)
		"special":
			return Color(1, 1, 0)
		_:
			return Color(1, 1, 1)
	
func change_labels_color(color: Color):
	print("color", color)
	name_label.modulate = color
	level_label.modulate = color

func update_labels():
	name_label.text = attributes.entityName
	level_label.text = str(attributes.level)
	change_labels_color(getCharacterTypeColor())
	pass

func setup_defaults():
	move_labels_above_entity()
	update_labels()
	pass

# Initialize with default values
func _ready():
	print("EntityLabelsComponent ready.")
	setup_defaults()
	pass
