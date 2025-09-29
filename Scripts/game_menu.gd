extends Node2D

@onready var backgrounds := [
	$"CanvasLayer/Control/Normal_Backgrounds",
	$"CanvasLayer/Control/G-Switch_Background",
	$"CanvasLayer/Control/Flappy_Background"
]

var index := 0
var current_background : Node = null


func _ready() -> void:
	index = 0
	current_background = backgrounds[index]



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Start_Game"):
		get_tree().change_scene_to_file("res://Scenes/game_manager.tscn")


func _on_switch_timer_timeout() -> void:

	if current_background == backgrounds[0]:
		var normal_background = $"CanvasLayer/Control/Normal_Backgrounds/Normal_Background"
		var normal_floor = $"CanvasLayer/Control/Normal_Backgrounds/Normal_Floor"
		normal_background.material.set_shader_parameter("intensity", 0.5)
		normal_floor.material.set_shader_parameter("intensity", 0.5)
		$GlitchTimer.start()
		return

	current_background.material.set_shader_parameter("intensity", 0.5)
	$GlitchTimer.start()


func _on_glitch_timer_timeout() -> void:
	print("Glitch timer timeout reached")

	# Reset shader
	if current_background == backgrounds[0]:
		var normal_background = $"CanvasLayer/Control/Normal_Backgrounds/Normal_Background"
		var normal_floor = $"CanvasLayer/Control/Normal_Backgrounds/Normal_Floor"
		normal_background.material.set_shader_parameter("intensity", 0)
		normal_floor.material.set_shader_parameter("intensity", 0)
	else:
		current_background.material.set_shader_parameter("intensity", 0)

	var new_index = index
	while new_index == index:
		new_index = randi_range(0, backgrounds.size() - 1)

	var new_scene = backgrounds[new_index]

	current_background.hide()
	new_scene.show()

	current_background = new_scene
	index = new_index

	$SwitchTimer.start()
