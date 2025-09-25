extends "level_base.gd"

func _on_player_flappy_game_over() -> void:
	print("Flappy game over")
	main_game.stop_game()

func _ready() -> void:
	main_game = get_parent()
	player = $"Player_Flappy"
	

func set_player_speed(new_speed: int = 50) -> void:
	player.speed = new_speed

func obstacle_spawn(rnd):
	var obstacle = preload("res://Scenes/obstacle_flappy.tscn").instantiate()
	obstacle.global_position = $Background/Obstacle_Spawn.position
	#I fucking hate this part, it should be changed into something more optimal
	if rnd == 1:
		obstacle.global_position.y = $Background/Obstacle_Spawn.position.y - 200
	elif rnd == 2:
		obstacle.global_position.y = $Background/Obstacle_Spawn.position.y - 400
	add_child(obstacle)
