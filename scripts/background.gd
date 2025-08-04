extends Parallax2D

@export var background_texture: CompressedTexture2D = preload("res://assets/textures/bg/Blue.png")
@export var scroll_speed := -25.0

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.texture = background_texture

func _process(_delta: float) -> void:
	autoscroll = Vector2(scroll_speed, scroll_speed)
