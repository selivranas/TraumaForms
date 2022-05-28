extends Control

func _ready():
	pass # Replace with function body.


func _on_TextureButton_pressed():
	get_tree().change_scene_to(load("res://GUI/StartScene.tscn"))


func _on_ButtonListForms_pressed():
	get_tree().change_scene_to(load("res://GUI/ListTraumaScene.tscn"))



func _on_ShoulderRight_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/DASH.tscn")


func _on_ShoulderRight_mouse_entered():
	$Background/Man/ShoulderRight/ShoulderRightFill.visible = true
	$Background/Man/ShoulderRight/ShoulderRightStroke.visible = true


func _on_ShoulderRight_mouse_exited():
	$Background/Man/ShoulderRight/ShoulderRightFill.visible = false
	$Background/Man/ShoulderRight/ShoulderRightStroke.visible = false


func _on_ShoulderLeft_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/QuickDASH.tscn")


func _on_ShoulderLeft_mouse_entered():
	$Background/Man/ShoulderLeft/ShoulderLeftFill.visible = true
	$Background/Man/ShoulderLeft/ShoulderLeftStroke.visible = true


func _on_ShoulderLeft_mouse_exited():
	$Background/Man/ShoulderLeft/ShoulderLeftFill.visible = false
	$Background/Man/ShoulderLeft/ShoulderLeftStroke.visible = false


func _on_KneeRight_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/AOFAS.tscn")


func _on_KneeRight_mouse_entered():
	$Background/Man/KneeRight/KneeRightFill.visible = true
	$Background/Man/KneeRight/KneeRightStroke.visible = true


func _on_KneeRight_mouse_exited():
	$Background/Man/KneeRight/KneeRightFill.visible = false
	$Background/Man/KneeRight/KneeRightStroke.visible = false


func _on_KneeLeft_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Mazur.tscn")


func _on_KneeLeft_mouse_entered():
	$Background/Man/KneeLeft/KneeLeftFill.visible = true
	$Background/Man/KneeLeft/KneeLeftStroke.visible = true

func _on_KneeLeft_mouse_exited():
	$Background/Man/KneeLeft/KneeLeftFill.visible = false
	$Background/Man/KneeLeft/KneeLeftStroke.visible = false


func _on_ButtonSaveForms_pressed():
	get_tree().change_scene("res://GUI/SavingForms.tscn")


func _on_ElbowRight_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Form25.tscn")


func _on_ElbowRight_mouse_entered():
	$Background/Man/ElbowRight/ElbowRightFill.visible = true
	$Background/Man/ElbowRight/ElbowRightStroke.visible = true


func _on_ElbowRight_mouse_exited():
	$Background/Man/ElbowRight/ElbowRightFill.visible = false
	$Background/Man/ElbowRight/ElbowRightStroke.visible = false


func _on_ElbowLeft_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Form24.tscn")


func _on_ElbowLeft_mouse_entered():
	$Background/Man/ElbowLeft/ElbowLeftFill.visible = true
	$Background/Man/ElbowLeft/ElbowLeftStroke.visible = true


func _on_ElbowLeft_mouse_exited():
	$Background/Man/ElbowLeft/ElbowLeftFill.visible = false
	$Background/Man/ElbowLeft/ElbowLeftStroke.visible = false
