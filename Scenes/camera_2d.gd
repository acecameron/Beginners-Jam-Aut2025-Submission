extends Camera2D

@onready var player = get_parent() # Adjust path as needed

func _process(delta):
	if player.is_on_floor():
		global_position.y = 0
		global_position = player.global_position
