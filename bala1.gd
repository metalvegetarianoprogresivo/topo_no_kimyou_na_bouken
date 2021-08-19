extends Area2D

var vel = Vector2()
const velo = 40

func _physics_process(delta):
	vel.y += velo * delta
	translate(vel)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_bala1_area_entered(area):
	queue_free()
