# AttributesComponent.gd
extends Node

class_name AttributesComponent

# Declare properties
@export var entityName: String = "Villager"
@export var level: int = 1
@export var entityType: CharacterTypes.Type = CharacterTypes.Type.NPC;

# Methods to handle attributes
func set_entity_name(new_name: String) -> void:
	name = new_name

func get_entity_name() -> String:
	return name

func set_level(new_level: int) -> void:
	level = new_level

func get_level() -> int:
	return level

func increase_level(amount: int = 1) -> void:
	level += amount
	print("Level increased to: ", level)
