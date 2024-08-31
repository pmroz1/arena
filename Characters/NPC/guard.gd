# Character.gd
extends Node3D

# References to the components
@onready var attributes_component: AttributesComponent = $AttributesComponent
@onready var labels_component : EntityLabelsComponent = $EntityLabelsComponent

func _ready():
	print("Character ready.")
#
	## Update the labels to reflect the attributes
	#label_component.set_entity_name(attributes_component.get_entity_name())
	#label_component.set_level(attributes_component.get_level())
#
	## Simulate attribute changes
	#attributes_component.increase_level()
	#label_component.set_level(attributes_component.get_level())  # Update label to new level
