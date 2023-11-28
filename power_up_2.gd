extends "res://PowerUp.gd"

signal double_score

func _on_body_entered(body: Node) -> void:
	double_score.emit()
