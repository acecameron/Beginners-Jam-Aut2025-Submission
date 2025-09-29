extends Node2D

var obstacle_paths : Array [String]
var main_game = get_parent()
var player : CharacterBody2D
var min_obstacle = 1
var max_obstacle = 2
var is_playing = true
var game_speed := 300
var min_time : float 
var max_time : float


func _on_obstacle_timer_timeout() -> void:
	if is_playing:
		var rnd = randi_range(min_obstacle, max_obstacle)
		obstacle_spawn(rnd, game_speed)
		$ObstacleTimer.wait_time = randf_range(min_time, max_time)
	else:
		$ObstacleTimer.stop()

func set_game_speed(new_speed: int = 50) -> void:
	game_speed = new_speed
	
func game_over():
	is_playing = false
	
func set_timer_range(new_min_timer : float, new_max_timer : float) -> void:
	min_time = max(0.1, min_time - new_min_timer)
	max_time = max(0.1, min_time - new_max_timer)
	
func obstacle_spawn(rnd : int, obstacle_speed : int):
	pass

func _physics_process(delta: float) -> void:
	$Label.position.x -= 5

func _on_text_timer_timeout() -> void:
	$Label.hide()
