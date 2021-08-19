extends Control



func _on_topo2_cambiovida(cambiovida):
	$VBoxContainer/lifebar.value = cambiovida


func _on_KinematicBody2D_cambiovida(cambiovida):
	$VBoxContainer/lifebar.value = cambiovida
