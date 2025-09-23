extends "obstacle_base.gd"



func _ready() -> void:
	var dir = randi_range(0, 1)
	if dir == 0:
		position.y -= 586
		$Sprite2D.flip_v = true
