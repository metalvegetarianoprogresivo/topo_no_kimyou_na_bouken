extends KinematicBody2D

onready var bala = preload("res://balastopo.tscn")
onready var bala2 = preload("res://balastopo2.tscn")

signal cambiovida(cambiovida)
signal muerto(estamuerto)

const ataqueEne = 5
const vel = 600

var mover = Vector2(400, 400)
var vida = 500
var mov = Vector2()
var colision
var b
var c
var ataque = true
var direccion = true

func _physics_process(delta):
	if ataque == false:
		atacar1(delta)
	else:
		atacar2(delta)
	dar_vuelta()
	
func atacar1(delta):
	
	colision = move_and_collide(mover * delta)
	if colision:
		mover = mover.bounce(colision.normal)
		$ataques2.start()
	
func atacar2(delta):
	
	if direccion == true:
		mov.y += vel * delta
	else:
		mov.y -= vel * delta
	
	move_and_slide(mov, Vector2(0, 0))
	
	
func dar_vuelta():
	
	if $vuelta2.is_colliding():
		$ataques1.start()
		if direccion == true:
			scale.y = -scale.y
			mov.y = 0
			direccion = false
			print("arriba")
			
		else:
			print("abajo")
			scale.y = -scale.y
			mov.y = 0
			direccion = true
			


func _on_ataques1_timeout():
	c = bala2.instance()
	get_parent().add_child(c)
	c.global_position = $balas.global_position


func _on_ataques2_timeout():
	
	b = bala.instance()
	get_parent().add_child(b)
	b.global_position = $balas.global_position


func _on_hurtbox_area_entered(area):
	vida -= ataqueEne
	modulate = Color.red
	emit_signal("cambiovida", vida)
	if vida <= 350:
		ataque = false
	if vida <= 0:
		emit_signal("muerto", true)
		queue_free()
	else:
		$stun.start()


func _on_stun_timeout():
	modulate = Color.white
