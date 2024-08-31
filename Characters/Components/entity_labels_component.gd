# LabelComponent.gd
extends Node3D

class_name EntityLabelsComponent

# Exported references to Label3D nodes
@onready var name_label: Label3D = $Name
@onready var level_label: Label3D =$Name/Level

@export var entity: Node3D
@export var height_offset : float = 2.0

# Methods to update the labels
func set_entity_name(entityName: String) -> void:
	print("Setting entity name to: " + entityName)
	if name_label:
		name_label.text = entityName

func set_level(level: int) -> void:
	if level_label:
		level_label.text = "Level: " + str(level)

func move_labels_above_entity(heightOverride: int = -1) -> void:
	# if heightOverride is not null, use it as the height offset
	if heightOverride != -1:
		height_offset = heightOverride

	if entity:
		var entity_global_position = entity.global_transform.origin
		var label_position = entity_global_position + Vector3(0, height_offset, 0)
		name_label.global_transform.origin = label_position

# Initialize with default values
func _ready():
	print("EntityLabelsComponent ready.")
	#set_entity_name("Unnamed")
	#set_level(1)
	#move_labels_above_entity()
	pass
