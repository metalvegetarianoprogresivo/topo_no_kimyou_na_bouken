extends Node2D

const first_scene = preload("res://prueba2.tscn")
const main_menu = preload("res://mainmenu.tscn")
var prevScene = ""
var nextScene = ""

func _ready():
	call_deferred("add_child", main_menu.instance())

func pizza(current_scene, scene = ""):
	prevScene = nextScene
	nextScene = scene
	if (current_scene):
		print('matando scene')
		current_scene.queue_free()
	$TransitionScreen.transition()
	#get_parent().add_child(main_menu.instance())
	print("Pizza con piña. Es lo mejor perros y mas la de tower.")

func _on_TransitionScreen_transitioned():
	if (nextScene == "scene_1"):
		get_parent().add_child(first_scene.instance())
	if (nextScene == "mainmenu"):
		get_parent().add_child(main_menu.instance())
	
	queue_free()

#func _on_mainmenu_GoToGame():
#	prevScene = 'mainnmenu'
#	nextScene = "scene_1"
#	$TransitionScreen.transition()

#func _on_pausa_gotomainmenu(extra_arg_0):
#	prevScene = nextScene
#	nextScene = extra_arg_0
#	$TransitionScreen.transition()
#
#
#func _on_mainmenu_GoToGame(extra_arg_0):
#	prevScene = 'mainmenu'
#	nextScene = extra_arg_0
#	$TransitionScreen.transition()
