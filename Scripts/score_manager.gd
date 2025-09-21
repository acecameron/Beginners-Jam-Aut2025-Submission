extends Node

var score := 0

@onready var score_label : Label = $"../CanvasLayer/Score_And_Highscore/ScoreBox/Curr_Score_Score"

func _ready() -> void:
	score_label.text = "00000"
	$ScoreTimer.start()

func update_score_label() -> void:
	score_label.text = String.num_int64(score).pad_zeros(5)


func _on_score_timer_timeout() -> void:
	score += 1   
	update_score_label()
