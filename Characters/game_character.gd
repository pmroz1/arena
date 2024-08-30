extends CharacterBody3D

# This is a script for game characters like npc / enemies / special objects / bosses
# It is a base class for all characters in the game
# It contains all the basic functionalities that a character should have
# It is a 3D character with a 3D body and a 3D label

@export var characterName: String = "Default Character"
@export var health: int = 100
@export var max_health: int = 100
@export var level: int = 1

@onready var name_label = $name# Assuming 'name_label' is the node name
@onready var level_label = $name/level# Assuming 'level_label' is the node name

func _ready():
	# Update both labels with the character's name and level
	update_labels()

func update_labels():
	if name_label:
		name_label.text = characterName
	else:
		print("Name label node not found or not properly assigned.")
	
	if level_label:
		level_label.text = "Level: " + str(level)
	else:
		print("Level label node not found or not properly assigned.")
