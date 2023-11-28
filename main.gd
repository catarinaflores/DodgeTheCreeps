extends Node

@export var mob_scene: Array[PackedScene]
@export var powerups_scene: Array[PackedScene]
var score: int

@onready var mob_timer: Timer = %MobTimer
@onready var score_timer: Timer = %ScoreTimer
@onready var start_timer: Timer = %StartTimer
@onready var start_position: Marker2D = %StartPosition
@onready var player: Area2D = %Player
@onready var mob_spawn_location: PathFollow2D = %MobSpawnLocation
@onready var hud: CanvasLayer = %HUD
@onready var game_over_music: AudioStreamPlayer2D = %GameOverMusic
@onready var background_music: AudioStreamPlayer2D = %BackgroundMusic
@onready var pause_screen: CanvasLayer = %PauseScreen
@onready var power_up_timer: Timer = %PowerUpTimer



# Called when the node enters the scene tree for the first time.
# func _ready() -> void:
	# new_game()


func game_over() -> void:
	mob_timer.stop()
	score_timer.stop()
	hud.show_game_over()
	hud.background_music.stop()
	hud.game_over_music.play()
	power_up_timer.start()

func new_game() -> void:
	score = 0
	player.start(start_position.position)
	start_timer.start()
	hud.update_score(score)
	hud.show_message("Get Ready")
	get_tree().call_group("mob", "queue_free")
	power_up_timer.start()


func _on_start_timer_timeout() -> void:
	mob_timer.start()
	score_timer.start()



func _on_score_timer_timeout() -> void:
	score += GameManager.score
	hud.update_score(score)


func _on_mob_timer_timeout() -> void:
	var mob : Node2D = mob_scene.pick_random().instantiate()
	add_child(mob)
	mob_spawn_location.progress_ratio = randf()
	var direction := mob_spawn_location.rotation_degrees + 90
	mob.position = mob_spawn_location.position
	direction += randf_range(- PI / 4, PI / 4)
	
	mob.spawn(mob_spawn_location.position, direction)
	# mob.rotation = direction
	# var velocity = Vector2(randf_range(150.0, 250.0), 0)
	# mob.linear_velocity = velocity.rotated(direction)


func _on_power_up_timer_timeout() -> void:
	var powerup: Node2D = powerups_scene.pick_random().instantiate()
	
	add_child(powerup)
	
	var _powerup_spawn_location = Vector2(randi_range(0, get_viewport().size.x),\
	randi_range(0, get_viewport().size.y))
	powerup.global_position = _powerup_spawn_location


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		pause_screen.show()
	

func _on_pause_screen_restart() -> void:
	new_game()


func _on_pause_screen_music_on() -> void:
	hud.background_music.play()

func _on_pause_screen_music_off() -> void:
	hud.background_music.stop()

