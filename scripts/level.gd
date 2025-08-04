extends Node2D

@onready var player: Player = $Player
@onready var spawn_position: Marker2D = $SpawnPosition

func _ready() -> void:
	var traps = get_tree().get_nodes_in_group("traps")
	
	for trap in traps:
		#trap.connect("touched_player", _on_trap_body_entered)
		trap.touched_player.connect(_on_trap_body_entered)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	reset_player_position()
	
func _on_trap_body_entered():
	reset_player_position()

func reset_player_position() -> void:
	player.velocity = Vector2.ZERO
	player.global_position = spawn_position.global_position
