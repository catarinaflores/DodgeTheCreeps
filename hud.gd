extends CanvasLayer

signal start_game

@onready var message: Label = %Message
@onready var message_timer: Timer = %MessageTimer
@onready var start_button: Button = %StartButton
@onready var score_label: Label = %ScoreLabel
@onready var background_music: AudioStreamPlayer2D = %BackgroundMusic
@onready var game_over_music: AudioStreamPlayer2D = %GameOverMusic


func show_message(text: String) -> void:
	message.text = text
	message.show()
	message_timer.start()


func show_game_over() -> void:
	show_message("Game Over")
	
	await message_timer.timeout
	
	message.text = "Dodge the Creeps!"
	message.show()
	
	await get_tree().create_timer(1.0).timeout
	start_button.show()


func update_score(score: int) -> void:
	score_label.text = str(score)


func _on_message_timer_timeout() -> void:
	message.hide()


func _on_start_button_pressed() -> void:
	start_button.hide()
	start_game.emit()
	background_music.play()
