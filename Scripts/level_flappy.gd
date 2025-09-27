extends "level_base.gd"

func _on_player_flappy_game_over() -> void:
	print("Flappy game over")
	main_game.stop_game()

func _ready() -> void:
	main_game = get_parent()
	player = $"Player_Flappy"
	min_time = 0.7
	max_time = 1.0
	
func _process(delta: float) -> void:
	if is_playing:
		$Background/ParallaxLayer.motion_offset.x -= game_speed * delta
func set_player_speed(new_speed: int = 50) -> void:
	player.speed = new_speed

func obstacle_spawn(rnd : int, obstacle_speed : int):
	var obstacle = preload("res://Scenes/obstacle_flappy.tscn").instantiate()
	obstacle.global_position = $Background/Obstacle_Spawn.position
	#I fucking hate this part, it should be changed into something more optimal
	if rnd == 1:
		obstacle.global_position.y = $Background/Obstacle_Spawn.position.y - 200
	elif rnd == 2:
		obstacle.global_position.y = $Background/Obstacle_Spawn.position.y - 400
	obstacle.speed = obstacle_speed
	player.connect("game_over", obstacle._on_player_game_over)
	player.connect("game_over", game_over)
	
	add_child(obstacle)
