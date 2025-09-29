extends "obstacle_base.gd"



func _ready() -> void:
	var dir = randi_range(0, 1)
	var if_scale = randi_range(0,3)
	if dir == 0:
		position.y -= 497 
		$Sprite2D.flip_v = true
	if if_scale == 0:
		if dir == 1:
			position.y -= 60
		else:
			position.y += 60
		scale.y *= 4
