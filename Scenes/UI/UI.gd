extends Control

@onready var player_score = $Player
@onready var AI_score = $AI

func _process(delta):
	player_score.text = str(Scores.player_score)
	AI_score.text = str(Scores.AI_score)
