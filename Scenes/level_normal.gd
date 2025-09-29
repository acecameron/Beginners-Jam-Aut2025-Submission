extends "level_base.gd"

func _on_player_dinasour_game_over() -> void:
	print("Normal game over")
	main_game.stop_game()

func _process(delta: float) -> void:
	if is_playing:
		$Background/ParallaxLayer.motion_offset.x -= game_speed * delta 
	
func _ready() -> void:
	main_game = get_parent()
	max_obstacle = 2
	player = $"Player_Dinasour"
	min_time = 1.0
	max_time = 1.5
	
func set_player_speed(new_speed: int = 50) -> void:
	player.speed = new_speed
func obstacle_spawn(rnd : int, obstacle_speed : int):
	
	var obstacle
	#I fucking hate this part, it should be changed into something more optimal
	if rnd == 1:
		obstacle = preload("res://Scenes/obstacle_nomral_1.tscn").instantiate()
	elif rnd == 2:
		obstacle = preload("res://Scenes/obstacle_nomral_2.tscn").instantiate()
	obstacle.global_position = $Background/Obstacle_Spawn.position
	obstacle.speed = obstacle_speed
	var if_scale = randi_range(0,3)
	if if_scale == 0:
		obstacle.scale *= 1.5
		obstacle.position.y -= 20
	player.connect("game_over", obstacle._on_player_game_over)
	player.connect("game_over", game_over)
	add_child(obstacle)

func prepare_to_switch() -> void:
	print("Switching")
	var shader_material = $Background/ParallaxLayer/TextureRect.material
	var sprite_shader_material = $Background/Sprite2D.material
	if shader_material and sprite_shader_material:
		print("Shader found")
		shader_material.set_shader_parameter("intensity", 0.5)
		sprite_shader_material.set_shader_parameter("intensity", 0.5) 
