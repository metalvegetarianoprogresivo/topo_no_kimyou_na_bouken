extends Area2D

var vel = Vector2()
const velo = 30

func _physics_process(delta):
	vel.x -= velo * delta
	translate(vel)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_balatopo_area_entered(area):
	queue_free()
