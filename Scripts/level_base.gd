extends Node2D

var obstacle_paths : Array [String]
var main_game = get_parent()
var player : CharacterBody2D
var min_obstacle = 1
var max_obstacle = 1

func _on_obstacle_timer_timeout() -> void:
	var rnd = randi_range(min_obstacle, max_obstacle)
	obstacle_spawn(rnd)


func _process(delta: float) -> void:
	$Background/Obstacle_Spawn.position.x += 10

func obstacle_spawn(rnd):
	pass
