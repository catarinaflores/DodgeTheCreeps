extends Node

var score = 1

func powerup_score() -> void:
	score = 2
	await get_tree().create_timer(10).timeout
	score = 1
