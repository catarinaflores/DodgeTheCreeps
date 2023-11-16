extends "res://mob.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("fly")


func spawn(spawn_pos: Vector2, spawn_rot: float) -> void:
	super(spawn_pos, spawn_rot)
	var og_velocity = linear_velocity*2
	
	await get_tree().create_timer(1.0).timeout
	linear_velocity = linear_velocity*0
	
	await get_tree().create_timer(1.0).timeout
	linear_velocity = og_velocity
