extends Node2D

signal touched_player

# signal up when player is in collision shape
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		touched_player.emit()
