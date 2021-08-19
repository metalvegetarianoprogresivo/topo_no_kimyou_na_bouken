extends KinematicBody2D

signal cambiovida(cambiovida)
signal muerto(estamuerto)

onready var bala1 = preload("res://disparacabezadehuevo.tscn")
var vel = 200
var mov = Vector2(300,300)
var colicion_info
var b
var vida = 150
const ataqEne = 4
var stun = false

func _physics_process(delta):
	colicion_info = move_and_collide(mov * delta)
	if colicion_info:
		atacar()
		mov = mov.bounce(colicion_info.normal)
	
func atacar():

	b = bala1.instance()
	get_parent().add_child(b)
	b.global_position = $bala1.global_position
	pass


func _on_hurtbox_area_entered(area):
	vida -= ataqEne
	emit_signal("cambiovida", vida)
	modulate = Color.red
	$stun.start()
	if vida <= 0:
		emit_signal("muerto", true)
		queue_free()

func _on_stun_timeout():
	
	modulate = Color.white
