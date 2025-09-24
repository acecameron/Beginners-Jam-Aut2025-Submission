extends "obstacle_base.gd"


func _ready() -> void:
	position.y -= randf_range(20.0, 540.0)
	$AnimatedSprite2D.play("Laser")



func _process(delta: float) -> void:
	if $VisibleOnScreenNotifier2D.is_on_screen() == false:
		position.x -= 200



func _on_animated_sprite_2d_animation_finished() -> void:
	print("Laser out")
	queue_free()
