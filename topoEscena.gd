extends Node

const first_scene = preload("res://escenaFinal.tscn")
#const game_over_scene = preload("res://gameover.tscn")
var scene_to_load = ''

func _process(_delta):
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()


func _on_topo_player_is_dead():
	scene_to_load = "gameover"
	$TransitionScreen.transition()


func _on_topo2_muerto(estamuerto):
	scene_to_load = 'end'
	$TransitionScreen.transition()


func _on_TransitionScreen_transitioned():
	if (scene_to_load == 'gameover'):
		get_parent().add_child(Global.game_over_scene.instance())
	if (scene_to_load == 'end'):
		get_parent().add_child(first_scene.instance())
	queue_free()
