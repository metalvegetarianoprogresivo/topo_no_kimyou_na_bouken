extends MarginContainer

#debo cambiar la first_secene por la real
const first_scene = preload("res://vittoescena.tscn")
var rng = RandomNumberGenerator.new()

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer3/VBoxContainer/CenterContainer/HBoxContainer/selector

var current_selection = 0

func _ready():
	rng.randomize()
	var title_sound = rng.randi_range(1, 5)
	if (title_sound == 1):
		$Title_1.play()
	if (title_sound == 2):
		$Title_2.play()
	if (title_sound == 3):
		$Title_3.play()
	if (title_sound == 4):
		$Title_4.play()
	if (title_sound == 5):
		$Title_5.play()
	set_current_selection(0)
	
func _process(_delta):
	if ($MenuMusic.playing == false):
		$MenuMusic.play()
	if Input.is_action_just_pressed("ui_down") and current_selection < 1:
		$SelectAudio.play()
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		$SelectAudio.play()
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		$SelectionAudio.play()
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
	get_parent().add_child(first_scene.instance())
	queue_free()
