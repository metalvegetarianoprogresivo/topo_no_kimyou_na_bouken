extends Area2D

const vel = 50
var mover = Vector2()

func _physics_process(delta):
	mover.x -= vel * delta
	translate(mover)
	



func _on_Area2D_area_entered(area):
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
