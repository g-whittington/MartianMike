extends CharacterBody2D

class_name Player

@export var gravity: int = 400
@export var max_gravity: int = 500

@export var speed: int = 125
@export var jump_force: int = 200

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	pass
	
func _process(_delta: float):
	pass
	
func _physics_process(delta: float) -> void:
	# make player have falling velocity while in the air
	if !is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > max_gravity:
			velocity.y = max_gravity
		
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
		
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		animated_sprite_2d.flip_h = direction == -1
		
	velocity.x = direction * speed
	move_and_slide()
	
	update_animation(direction)
	
func update_animation(direction: int) -> void:
	if is_on_floor():
		if direction != 0:
			animated_sprite_2d.play("run")			
		else:
			animated_sprite_2d.play("idle")
	else:
		if velocity.y > 0:
			animated_sprite_2d.play("fall")
		else:
			animated_sprite_2d.play("jump")
		
func jump(force: int) -> void:
	velocity.y = -force
