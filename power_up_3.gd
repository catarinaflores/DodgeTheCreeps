extends "res://PowerUp.gd"



func _on_area_entered(area: Area2D) -> void:
	GameManager.powerup_score()
	queue_free()

