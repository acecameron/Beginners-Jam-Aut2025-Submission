extends "level_base.gd"


func _on_player_g_switch_game_over() -> void:
	print("G-Switch game over")
	main_game.stop_game()
	
func _ready() -> void:
	main_game = get_parent()
	player = $"Player_G-Switch"


func set_player_speed(new_speed: int = 50) -> void:
	player.speed = new_speed


func obstacle_spawn(rnd):
	var obstacle
	if rnd == 1:
		obstacle = preload("res://Scenes/g_switch_obstacle_1.tscn").instantiate()
		obstacle.global_position = $Background/Obstacle_Spawn.position
		add_child(obstacle)
	#if rnd == 2:
		#obstacle = preload("res://Scenes/g_switch_obstacle_2.tscn").instantiate()
		#obstacle.global_position = $Background/Obstacle_Spawn.position
		#add_child(obstacle)
		#print("Laser")
