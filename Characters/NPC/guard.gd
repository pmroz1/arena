# Character.gd
extends Node3D

# References to the components
@onready var attributes_component: AttributesComponent = $AttributesComponent
@onready var label_component: EntityLabelsComponent = $EntityLabelsComponent

func _ready():
	print("Character ready.")
	# Initialize attributes and labels
	attributes_component.set_entity_name("Guard")
	attributes_component.set_level(5)
	
	

	# Update the labels to reflect the attributes
	label_component.set_entity_name(attributes_component.get_entity_name())
	label_component.set_level(attributes_component.get_level())

	# Simulate attribute changes
	attributes_component.increase_level()
	label_component.set_level(attributes_component.get_level())  # Update label to new level
