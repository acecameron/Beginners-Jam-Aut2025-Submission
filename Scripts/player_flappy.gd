extends "player_base.gd"

const GRAVITY = 1200
const JUMPFORCE = -600

func _physics_process(delta: float) -> void:
	if not alive:
		return
	if is_on_floor():
		die()
	if Input.is_action_just_pressed("Jump"):
		velocity.y = JUMPFORCE  
		$AnimatedSprite2D.play("jump")
	if Input.is_action_just_released("Jump") and velocity.y < 0:
		velocity.y *= 0.5
	velocity.y += GRAVITY * delta
	move()
