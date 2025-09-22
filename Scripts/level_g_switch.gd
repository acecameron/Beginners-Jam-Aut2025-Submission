extends "level_base.gd"


func _on_player_g_switch_game_over() -> void:
	main_game.stop_game()
	
func _ready() -> void:
	main_game = get_parent()
