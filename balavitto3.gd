extends Area2D

const vel = 250
var mover = Vector2()

func _physics_process(delta):
	mover.x = -vel * delta
	mover.y = vel * delta
	translate(mover)
	$AnimatedSprite.play()
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_balavitto3_area_entered(area):
	queue_free()
