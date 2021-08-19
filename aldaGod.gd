extends KinematicBody2D

signal cambiovida(cambiovida)
signal muerto(estamuerto)

onready var bala = preload("res://balalda.tscn")
onready var bala2 = preload("res://balalda2.tscn")
onready var bala3 = preload("res://balavitto.tscn")

var mover = Vector2()
var vel = 75
var vida = 75
var direccion = true
var saltando = false
var b
var a
var c

const ataqueEne = 5
const gravedad = 40
const salto = -800

func moverse(delta):
	
	mover.y += gravedad
	if direccion == true:
		mover.x -= vel * delta
		
	else:
		mover.x += vel * delta
		
	if is_on_floor():
		saltando = false
		
		
	move_and_slide(mover, Vector2(0, -1))
	


func _process(delta):
	moverse(delta)
	darvuelta()
	
	
	
func atacar():
	if direccion == true:
		b = bala.instance()
		get_parent().add_child(b)
		b.global_position = $bala.global_position
		
		c = bala.instance()
		get_parent().add_child(c)
		c.global_position = $bala2.global_position
	else:
		a = bala2.instance()
		get_parent().add_child(a)
		a.global_position = $bala.global_position
		
		c = bala2.instance()
		get_parent().add_child(c)
		c.global_position = $bala2.global_position
		
func contrataque():
	if direccion == true:
		b = bala2.instance()
		get_parent().add_child(b)
		b.global_position = $contraatacar.global_position
	else:
		a = bala.instance()
		get_parent().add_child(a)
		a.global_position = $contraatacar.global_position
		
		
			
func saltar():
	if is_on_floor():
		mover.y = salto

func ataquesalto():
	pass	

func darvuelta():
	if $colision.is_colliding():
		if direccion == true:
			direccion = false
			mover.x = 0
			scale.x = -scale.x	
		else:
			direccion = true
			mover.x = 0
			scale.x = -scale.x	
		#$salto.start()
		

func _on_hitbox_area_entered(_area):
	print("hit")
	contrataque()
	vida -= ataqueEne
	modulate = Color.red
	emit_signal("cambiovida", vida)
	if vida <= 0:
		emit_signal("muerto", true)
		queue_free()
	else:
		$stun.start()
		
func _on_defensa_area_entered(_area):
	print("No_Hit")



func _on_saltar_timeout():
	print("Hola mundo!")
	saltando = true
	if saltando == true:
		mover.y = salto
		


func _on_ataca_timeout():
	atacar()


func _on_stun_timeout():
	modulate = Color.white
