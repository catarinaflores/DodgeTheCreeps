extends "res://mob.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("fly")

func spawn(spawn_pos: Vector2, spawn_rot: float) -> void:
	super(spawn_pos, spawn_rot)
	disappear()

func disappear() -> void:
	animated_sprite_2d.modulate.a = 0
	var tween = get_tree().create_tween()
	tween.tween_property(animated_sprite_2d, "modulate:a", 1, 1)
	tween.tween_property(animated_sprite_2d, "modulate:a", 0, 1)
	tween.set_loops()
