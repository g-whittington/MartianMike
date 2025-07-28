extends Node2D

@onready var death_zone: Area2D = $DeathZone

func _ready() -> void:
	# maybe bad? Must always be in a Traps sub node to work
	death_zone.spawn_position = $"../SpawnPosition"
	
