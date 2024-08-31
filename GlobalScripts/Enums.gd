extends Node

enum Type {
	NPC,
	Enemy,
	Boss,
	Special
}

enum RoutineType {
	Idle,
	Walk,
	Attack,
	Defend,
	Dead,
	Guard,
	Patrol,
	Heal,
}

enum WeaponType {
	Sword,
	Mace,
	Axe,
	Staff,
	Bow,
	Shield,
	Special
}

enum ArmorType {
	Head,
	Body,
	Hands,
	Legs,
	Feet,
	Accessory,
}

enum AccessoryType {
	Necklace,
	Ring,
	Bracelet,
	Ear,
	Other,
}

enum ConsumableType {
	Health,
	Mana,
	Stamina,
	Buff,
	Other,
}
