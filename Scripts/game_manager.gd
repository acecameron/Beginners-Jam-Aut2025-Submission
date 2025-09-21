extends Node2D

var score := 0
var level := 0

@onready var score_label : Label = $"CanvasLayer/Score_And_Highscore/ScoreBox/Curr_Score_Score"

var level_runner_nomral := preload("res://Scenes/level_normal.tscn")
var level_runner_flappy := preload("res://Scenes/level_flappy.tscn")
var level_runner_g_switch := preload("res://Scenes/level_g_switch.tscn")

var current_level : Node2D 

func _ready() -> void:
	score_label.text = "00000"
	$ScoreTimer.start()
	current_level = level_runner_g_switch.instantiate()
	add_child(current_level)

func update_score_label() -> void:
	score_label.text = String.num_int64(score).pad_zeros(5)


func _process(delta: float) -> void:
	pass
		
func _on_score_timer_timeout() -> void:
	score += 1   
	update_score_label()

func _on_start_over_button_pressed() -> void:
	pass # Replace with function body.
