extends CanvasLayer

signal transitioned

func transition():
	$AnimationPlayer.play("FadeFromAlpha")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeFromAlpha":
		emit_signal("transitioned")
		$AnimationPlayer.play("FadeFromBlack")
	if anim_name == "FadeFromBlack":
		print("Finished fading")
