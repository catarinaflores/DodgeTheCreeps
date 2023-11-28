extends "res://PowerUp.gd"


func _on_area_entered(area: Area2D) -> void:
	get_tree().call_group("mob", "queue_free")
	queue_free()
