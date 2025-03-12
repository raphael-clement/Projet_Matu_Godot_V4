extends Control

func ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backward("Blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("Blur")

func TestEsc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()


func _on_resume_pressed() -> void:
	resume()


func _on_documentation_pressed() -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit


func _process(delta: float) -> void:
	TestEsc()
