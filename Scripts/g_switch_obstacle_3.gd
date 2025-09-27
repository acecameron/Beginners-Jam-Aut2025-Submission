extends "obstacle_base.gd"


func _ready() -> void:
	position.y -= randi_range(10, 500)



func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("Spin")
