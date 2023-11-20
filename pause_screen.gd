extends CanvasLayer



func _on_resume_pressed() -> void:
	hide()
	await get_tree().create_timer(3.0)
	get_tree().paused = false
	


func _on_restart_pressed() -> void:
	hide()
	get_tree().paused = false
	get_tree().main.new_game()


func _on_quit_pressed() -> void:
	get_tree().quit()
