extends KinematicBody2D


signal cambiovida(vida)
signal muerto(estamuerto)
onready var bala = preload("res://balavitto.tscn")
var vel = 500
var mover = Vector2()
var vida = 250
var ataqEne = 5
var direccion = true
var b

func _physics_process(delta):
	moverse(delta)
	dar_vuelta()
func atacar():
	pass	

func moverse(delta):
	
	if direccion == true:
		mover.x -= vel * delta
	else:
		mover.x += vel * delta
	
	move_and_slide(mover, Vector2(0,0))
	print(mover.x)
	print(direccion)
	print (scale.x)
	print($RayCast2D.get_collider())
	
func dar_vuelta():
	if $RayCast2D.is_colliding():
		$atacar.start()
		if direccion == true:
			scale.x = -scale.x	
			mover.x = 0
			direccion = false
		else:
			scale.x = -scale.x
			mover.x = 0
			direccion = true	



func _on_atacar_timeout():
	b = bala.instance()
	get_parent().add_child(b)
	b.global_position = $bala.global_position


func _on_hurtbox_area_entered(area):
	vida -= ataqEne
	modulate = Color.red
	emit_signal("cambiovida", vida)
	if vida <= 0:
		emit_signal("muerto", true)
		queue_free()
	else:
		
		$stun.start()


func _on_stun_timeout():
	modulate = Color.white
