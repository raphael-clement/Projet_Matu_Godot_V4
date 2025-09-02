extends Control

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_W:
			print("W")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Add_Files/Scenes/Game.tscn")



func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Add_Files/Scenes/settings.tscn")




func _on_exit_pressed() -> void:
	get_tree().quit()
