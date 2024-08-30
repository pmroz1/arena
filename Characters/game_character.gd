extends CharacterBody3D

# This is a script for game characters like npc / enemies / special objects / bosses
# It is a base class for all characters in the game
# It contains all the basic functionalities that a character should have
# It is a 3D character with a 3D body and a 3D label

@export var characterName: String = "Default Character"
@export var health: int = 100
@export var max_health: int = 100
@export var level: int = 1
@export var characterType: CharacterTypes.Type = CharacterTypes.Type.NPC  # Use enum

@onready var name_label = $name
@onready var level_label = $name/level

func _ready():
	# Update both labels with the character's name and level
	update_labels()

func update_labels():
	var font_color: Color
	match characterType:
		CharacterTypes.Type.NPC:
			font_color = Color(0, 1, 0)  # Green for NPC
		CharacterTypes.Type.Enemy:
			font_color = Color(1, 0, 0)  # Red for Enemy
		CharacterTypes.Type.Boss:
			font_color = Color(0, 0, 1)  # Blue for Boss
		CharacterTypes.Type.Special:
			font_color = Color(1, 1, 0)  # Yellow for Special Object
		_:
			font_color = Color(1, 1, 1)  # White for default

	# Apply the font color using self_modulate
	if name_label:
		name_label.modulate = font_color
		name_label.text = characterName
	else:
		print("Name label node not found or not properly assigned.")

	if level_label:
		level_label.modulate = font_color  # Optionally, set the level color too
		level_label.text = "Level: " + str(level)
	else:
		print("Level label node not found or not properly assigned.")
