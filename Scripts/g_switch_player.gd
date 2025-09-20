extends CharacterBody2D


var speed = 50
var gravity = 50
var dir = Vector2.UP



func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("grav_change"):
		if dir == Vector2.UP:
			gravity = 250
			dir = Vector2.DOWN
		else:
			gravity = -250
			dir = Vector2.UP
	
	velocity.x += speed
	velocity.y += gravity
	move_and_slide()
	velocity.y = lerp(velocity.y, 0.0, 0.2)
