extends Area2D


func spawn(position: Vector2) -> void:
	position = Vector2(randi_range(0, get_viewport().size.x),\
	randi_range(0, get_viewport().size.y))
