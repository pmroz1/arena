extends Node3D

@export var weaponName: String = "Weapon"
@export var weaponType: String = "Sword"
@export var damage: int = 10
@export var attackSpeed: float = 1.0
@export var attack_range: float = 1.0
@export var criticalChance: float = 0.1
@export var criticalDamage: float = 1.5
@export var staminaCost: int = 10
@export var manaCost: int = 0
@export var cooldown: float = 1.0
# @export var specialEffect: EffectType = null

# Called when the node enters the scene tree for the first time.
func _ready():
	set_defaults_for_weapon_type()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_defaults_for_weapon_type():
	if Config.WeaponTypeDefaultConfig.has(weaponType):
		var config = Config.WeaponTypeDefaultConfig[weaponType]
		damage = config["damage"]
		attackSpeed = config["attack_speed"]
		attack_range = config["range"]
		criticalChance = config["critical_chance"]
		criticalDamage = config["critical_damage"]
		staminaCost = config["stamina_cost"]
		manaCost = config["mana_cost"]
		cooldown = config["cooldown"]
	else:
		# Set default values if weapon type is not found
		damage = 10
		attackSpeed = 1.0
		attack_range = 1.0
		criticalChance = 0.1
		criticalDamage = 1.5
		staminaCost = 10
		manaCost = 0
		cooldown = 1.0
