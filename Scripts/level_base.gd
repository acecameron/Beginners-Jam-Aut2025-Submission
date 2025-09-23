extends Node2D

var obstacle_paths : Array
var main_game = get_parent()
var player : CharacterBody2D


func _on_obstacle_timer_timeout() -> void:
	var rnd = randi_range(1, 1)
	obstacle_spawn(rnd)


func _process(delta: float) -> void:
	$Background/Obstacle_Spawn.position.x += 10

func obstacle_spawn(rnd):
	pass
