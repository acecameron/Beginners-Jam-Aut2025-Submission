extends "level_base.gd"

func _on_player_dinasour_game_over() -> void:
	print("Normal game over")
	main_game.stop_game()


	
func _ready() -> void:
	main_game = get_parent()
	max_obstacle = 2
	player = $"Player_Dinasour"
	
func set_player_speed(new_speed: int = 50) -> void:
	player.speed = new_speed
func obstacle_spawn(rnd):
	
	var obstacle
	#I fucking hate this part, it should be changed into something more optimal
	if rnd == 1:
		obstacle = preload("res://Scenes/obstacle_nomral_1.tscn").instantiate()
	elif rnd == 2:
		obstacle = preload("res://Scenes/obstacle_nomral_2.tscn").instantiate()
	obstacle.global_position = $Background/Obstacle_Spawn.position
	add_child(obstacle)
