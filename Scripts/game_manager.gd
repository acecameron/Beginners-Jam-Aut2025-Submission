extends Node2D

var score := 0
var level := 0
var high_score := 0
var speed := 300

@onready var score_label : Label = $"CanvasLayer/Score_And_Highscore/ScoreBox/Curr_Score_Score"
@onready var high_score_box : HBoxContainer = $"CanvasLayer/Score_And_Highscore/HighScoreBox"
@onready var high_score_label : Label = $"CanvasLayer/Score_And_Highscore/HighScoreBox/Hi_Score_Score"
@onready var game_over_ui : Control = $"CanvasLayer/Game_Over"

var level_normal := preload("res://Scenes/level_normal.tscn")
var level_flappy := preload("res://Scenes/level_flappy.tscn")
var level_g_switch := preload("res://Scenes/level_g_switch.tscn")

var level_scenes : Array[PackedScene] = [level_normal, level_flappy, level_g_switch]
var current_level : Node2D

func _ready() -> void:
	score = 0
	score_label.text = "00000"
	$ScoreTimer.start()
	high_score_box.hide()
	game_over_ui.hide()
	# start with one level
	current_level = level_normal.instantiate()
	add_child(current_level)

func update_score_label() -> void:
	score_label.text = String.num_int64(score).pad_zeros(5)

func _on_score_timer_timeout() -> void:
	score += 1 
	update_score_label()
	
	# Every 100 points, replace the level
	if score % 30 == 0:
		replace_level()

func replace_level() -> void:
	if not current_level:
		return
	
	current_level.queue_free()
	
	var new_scene : PackedScene = null
	while true:
		var candidate = level_scenes.pick_random()
		if candidate.resource_path != current_level.scene_file_path:
			new_scene = candidate
			break
	
	current_level = new_scene.instantiate()
	add_child(current_level)
	print(current_level)
	print(current_level.get_script())
	speed += 130
	current_level.set_game_speed(speed)
	
	
func stop_game():
	$ScoreTimer.stop()
	if high_score < score:
		high_score_label.text = String.num_int64(score).pad_zeros(5)
	game_over_ui.show()
	high_score_box.show()
	


func _on_start_over_button_pressed() -> void:
	print("Start over pressed")
	current_level.queue_free()
	_ready()
	
