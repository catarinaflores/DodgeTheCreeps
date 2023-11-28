extends Area2D


func _ready() -> void:
	powerup_gone()


func powerup_gone() -> void:
	await get_tree().create_timer(4).timeout
	queue_free()
