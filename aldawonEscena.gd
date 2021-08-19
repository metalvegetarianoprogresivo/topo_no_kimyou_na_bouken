extends Node

const first_scene = preload("res://topoEscena.tscn")
#const game_over_scene = preload("res://gameover.tscn")
var scene_to_load = ''

func _process(_delta):
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()


func _on_TransitionScreen_transitioned():
	if (scene_to_load == 'gameover'):
		get_parent().add_child(Global.game_over_scene.instance())
	if (scene_to_load == 'topo'):
		get_parent().add_child(first_scene.instance())
	queue_free()


func _on_topo_player_is_dead():
	scene_to_load = 'gameover'
	$TransitionScreen.transition()


func _on_KinematicBody2D_muerto(estamuerto):
	scene_to_load = 'topo'
	$TransitionScreen.transition()
