extends CharacterBody2D

signal game_over

@export var speed := 300
var alive := true

func _ready():
	velocity.x = speed

func move():
	move_and_slide()
	$AnimatedSprite2D.play("running")
	
func die():
	print("Stopping now")
	alive = false
	velocity.x = 0
	$AnimatedSprite2D.play("death")
	emit_signal("game_over")

func _on_enemy_collison_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Obstacles"):
		die()
	
func _physics_process(delta: float) -> void:
	if alive:
		move()
