extends Node2D

var speed := 300
var player_alive := true


func _process(delta: float) -> void:
	if player_alive:
		position.x -= speed * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
 
func _on_player_game_over() -> void:
	player_alive = false
