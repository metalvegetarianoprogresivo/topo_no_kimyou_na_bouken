extends Area2D

onready var bala = preload("res://balaenemiga2.tscn")
var b

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ataque_area_entered(area):
	b = bala.instance()
	get_parent().add_child(b)
	#b.global_position = $Position2D.global_position
