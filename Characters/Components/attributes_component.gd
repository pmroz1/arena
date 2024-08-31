# AttributesComponent.gd
extends Node

class_name AttributesComponent

# Declare properties
var entityName: String = "Unnamed"
var level: int = 1

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
