extends CharacterBody2D

signal game_over

@export var speed := 150
var alive := true

func _ready():
	velocity.x = speed
	print(speed)

func move():
	move_and_slide()
	$AnimatedSprite2D.play("running")
	
func die():
	print("Stopping jow")
	alive = false
	$AnimatedSprite2D.play("death")
	emit_signal("game_over")

func _on_enemy_collison_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Obstacles"):
		die()
	
func _physics_process(delta: float) -> void:
	if alive:
		move()
