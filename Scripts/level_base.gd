extends Node2D

var obstacle_paths : Array [String]
var main_game = get_parent()
var player : CharacterBody2D
var min_obstacle = 1
var max_obstacle = 2
var is_playing = true

func _on_obstacle_timer_timeout() -> void:
	if is_playing:
		var rnd = randi_range(min_obstacle, max_obstacle)
		obstacle_spawn(rnd)
	else:
		$ObstacleTimer.stop()


func _process(delta: float) -> void:
	if is_playing:
		$Background/Obstacle_Spawn.position.x += 10


func game_over():
	is_playing = false
	print ("game over")

func obstacle_spawn(rnd):
	pass
