extends "level_base.gd"


func _on_player_g_switch_game_over() -> void:
	print("G-Switch game over")
	main_game.stop_game()
	
func _ready() -> void:
	main_game = get_parent()
	player = $"Player_G-Switch"
	min_time = 1
	max_time = 3

func _process(delta: float) -> void:
	if is_playing:
		$Background/ParallaxLayer.motion_offset.x -= game_speed * delta
func set_player_speed(new_speed: int = 50) -> void:
	player.speed = new_speed


func obstacle_spawn(rnd : int, obstacle_speed : int):
	var obstacle
	if rnd == 1:
		obstacle = preload("res://Scenes/g_switch_pattern_one.tscn").instantiate()
		obstacle.global_position = $Background/Obstacle_Spawn.position
		obstacle.speed = obstacle_speed
		var flip = randi_range(0,1)

		player.connect("game_over", obstacle._on_player_game_over)
		player.connect("game_over", game_over)
		add_child(obstacle)
	#if rnd == 2:
		#obstacle = preload("res://Scenes/g_switch_obstacle_2.tscn").instantiate()
		#obstacle.global_position = $Background/Obstacle_Spawn.position
		#add_child(obstacle)
		#print("Laser")
