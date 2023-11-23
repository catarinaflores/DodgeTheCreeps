extends CanvasLayer
signal restart
signal music_on
signal music_off


func _on_resume_pressed() -> void:
	hide()
	await get_tree().create_timer(3.0).timeout
	get_tree().paused = false


func _on_restart_pressed() -> void:
	hide()
	get_tree().paused = false
	# nunca fazer isto get_tree().main.new_game()
	restart.emit()


func _on_quit_pressed() -> void:
	get_tree().quit()



func _on_sound_on_pressed() -> void:
	music_on.emit()


func _on_sound_off_pressed() -> void:
	music_off.emit()
