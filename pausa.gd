extends Control

#const mainmenu = preload("res://mainmenu.tscn")

func _ready():
	$MarginContainer/CenterContainer/VBoxContainer/continuar.grab_focus()
	
func _physics_process(delta):
	if $MarginContainer/CenterContainer/VBoxContainer/continuar.is_hovered() == true:
		$MarginContainer/CenterContainer/VBoxContainer/continuar.grab_focus()
	if $MarginContainer/CenterContainer/VBoxContainer/reiniciar.is_hovered() == true:
		$MarginContainer/CenterContainer/VBoxContainer/reiniciar.grab_focus()
	if $MarginContainer/CenterContainer/VBoxContainer/salir.is_hovered() == true:
		$MarginContainer/CenterContainer/VBoxContainer/salir.grab_focus()
		
func _input(event):
	if event.is_action_pressed("pausa"):
		$MarginContainer/CenterContainer/VBoxContainer/continuar.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible	


func _on_continuar_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible


func _on_reiniciar_pressed():
	get_tree().quit()

func _on_salir_pressed():
	get_tree().quit()
