extends Area2D

onready var bala = preload("res://bala2.tscn")
var b
func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	b = bala.instance()
	get_parent().add_child(b)
	#b.global_position = $atacar.global_position
