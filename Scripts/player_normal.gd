extends "player_base.gd"

const GRAVITY = 1200
const JUMPFORCE = -600

func _physics_process(delta: float) -> void:
	if not alive:
		return
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		print("Jumping now")
		velocity.y = JUMPFORCE  # already negative, so no need to multiply
	if Input.is_action_just_released("Jump") and velocity.y < 0:
		velocity.y *= 0.5

	velocity.y += GRAVITY * delta
	move()
