extends "level_base.gd"

func _ready() -> void:
	main_game = get_parent() 
	player = $"Player_Flappy"
	
func _on_player_flappy_game_over() -> void:
	main_game.stop_game()

func set_player_speed(new_speed: int = 50) -> void:
	player.speed = new_speed
