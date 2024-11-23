extends CanvasLayer

func _on_retry_button_pressed() -> void:
	print("Retry")
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
