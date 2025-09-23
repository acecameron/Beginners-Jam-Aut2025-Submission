extends "player_base.gd"


var gravity = 50
var jump := 50
var dir = Vector2.DOWN

func _ready() -> void:
	velocity.x = speed
	$AnimatedSprite2D.play("running")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump"):
		position.y -= jump
		jump *= -1
		if dir == Vector2.UP:
			gravity = 250
			dir = Vector2.DOWN
		else:
			gravity = -250
			dir = Vector2.UP
		if $AnimatedSprite2D.flip_v:
			$AnimatedSprite2D.flip_v = false
		else:
			$AnimatedSprite2D.flip_v = true

	
	velocity.y += gravity
	move_and_slide()
	velocity.y = lerp(velocity.y, 0.0, 0.2)
