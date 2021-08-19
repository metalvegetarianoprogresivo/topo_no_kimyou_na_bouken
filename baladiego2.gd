extends Area2D

var vel = Vector2()
const velo = 800

func _physics_process(delta):
	vel.x = velo * delta
	translate(vel)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	queue_free()
