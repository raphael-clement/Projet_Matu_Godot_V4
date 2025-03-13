class_name PauseMenu
extends Control

@export var gameplay_manager : GameplayManager

func _ready() -> void:
	hide()
	gameplay_manager.connect("toggle_game_paused", _on_gameplay_manager_toggle_game_paused)


func _on_gameplay_manager_toggle_game_paused(is_paused: bool):
	if(is_paused):
		show()
	else:
		hide()
