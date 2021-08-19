extends HBoxContainer



func _on_KinematicBody2D_cambiovida(new_value : int) ->void:
	$TextureProgress.value = new_value
	


func _on_topo_cambiovida(new_value):
	$TextureProgress.value = new_value
