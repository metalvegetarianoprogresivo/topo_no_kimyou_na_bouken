extends KinematicBody2D

signal cambiovida(vidajefe)
signal muerto(estamuerto)

onready var bala = preload("res://baladiego.tscn")
onready var bala2 = preload("res://baladiego2.tscn")
var ene_vida = 1000
var ene_ataque = 10
var vel = 300
var mover = Vector2()
var stun = false
const mover2 = Vector2(0,-1)
var estado = 0
var b
var a
var direccion = true

func _ready():
	pass
	
func moverse(delta):
	
	if direccion == true:
		mover.x -= vel * delta
	else:
		mover.x += vel * delta
	
	move_and_slide(mover, Vector2(0,0))
	
func _physics_process(delta):
	
	dar_vuelta()
	moverse(delta)
	
func dar_vuelta():
	if $deteccion.is_colliding():
		if direccion == true:
			scale.x = -scale.x	
			mover.x = 0
			direccion = false
		else:
			scale.x = -scale.x
			mover.x = 0
			direccion = true


func _on_Area2D_area_entered(_area):
	#cuando entra otra area al personaje se reduce el daño, se genera el stun y se elimina el objeto que entra
	ene_vida -= 10
	modulate = Color.red
	emit_signal("cambiovida", ene_vida)
	stun = true
	$Sprite/stun.start()
	if ene_vida <= 0:
		emit_signal("muerto", true)
		queue_free()
		

func _on_stun_timeout():
	modulate = Color("ffffff")
	

func _on_ataquetime_timeout():
	if direccion == true:
		b = bala.instance()
		get_parent().add_child(b)
		b.global_position = $ataque2.global_position
	else:
		a = bala2.instance()
		get_parent().add_child(a)
		a.global_position = $ataque2.global_position


func _on_defensa_area_entered(area):
	print("No Hit")
