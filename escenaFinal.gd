extends MarginContainer

func _process(delta):
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().quit()
