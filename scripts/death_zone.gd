extends Area2D

@export var spawn_position: Marker2D

# body will always be player
func _on_body_entered(body: Node2D) -> void:
	body.velocity = Vector2.ZERO
	body.position = spawn_position.global_position
