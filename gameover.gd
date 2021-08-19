extends MarginContainer

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer3/VBoxContainer/CenterContainer/HBoxContainer/selector

var current_selection = 0

func _ready():
	set_current_selection(0)
	
func _process(_delta):
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("ui_down") and current_selection < 1:
		$SelectSound.play()
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		$SelectSound.play()
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		$SelectionSound.play()
		handle_selection(current_selection)
		pass
func handle_selection(_current_selection):
	if _current_selection == 0:
		$TransitionScreen.transition()
#		get_parent().add_child(first_scene.instance())
#		queue_free()
	if _current_selection == 1:
		get_tree().quit()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	if _current_selection == 0:
		selector_one.text =">"
		pass
	elif _current_selection == 1:
		selector_two.text =">"


func _on_TransitionScreen_transitioned():
	get_tree().change_scene("res://mainmenu.tscn")
	queue_free()
