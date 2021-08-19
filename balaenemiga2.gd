extends Sprite

var vel = Vector2()
const velo = 200

func _physics_process(delta):
	vel.y += velo * delta
	translate(vel)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



