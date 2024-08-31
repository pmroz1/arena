# LabelComponent.gd
extends Node3D

class_name EntityLabelsComponent

# Exported references to Label3D nodes
@export var name_label: Label3D
@export var level_label: Label3D

# Methods to update the labels
func set_entity_name(entityName: String) -> void:
	print("Setting entity name to: " + entityName)
	if name_label:
		name_label.text = entityName

func set_level(level: int) -> void:
	if level_label:
		level_label.text = "Level: " + str(level)

# Initialize with default values
func _ready():
	print("EntityLabelsComponent ready.")
	set_entity_name("Unnamed")
	set_level(1)
