extends Node2D

@onready var player = $"Paddle Player"
@onready var AI = $"Paddle AI"
@onready var ball = $Ball


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Reset"):
		_reset()

func _reset():
	Scores.player_score = 0
	Scores.AI_score = 0
	player.global_position.y = Intial.position_y
	AI.global_position.y = Intial.position_y
	ball.global_position = Intial.ball_position
	get_tree().change_scene_to_file("res://Scenes/Levels/main_menu.tscn")
