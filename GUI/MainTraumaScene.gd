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
	$Background/Man/ShoulderRight/Label.visible = true


func _on_ShoulderRight_mouse_exited():
	$Background/Man/ShoulderRight/ShoulderRightFill.visible = false
	$Background/Man/ShoulderRight/ShoulderRightStroke.visible = false
	$Background/Man/ShoulderRight/Label.visible = false


func _on_ShoulderLeft_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/QuickDASH.tscn")


func _on_ShoulderLeft_mouse_entered():
	$Background/Man/ShoulderLeft/ShoulderLeftFill.visible = true
	$Background/Man/ShoulderLeft/ShoulderLeftStroke.visible = true
	$Background/Man/ShoulderLeft/Label.visible = true


func _on_ShoulderLeft_mouse_exited():
	$Background/Man/ShoulderLeft/ShoulderLeftFill.visible = false
	$Background/Man/ShoulderLeft/ShoulderLeftStroke.visible = false
	$Background/Man/ShoulderLeft/Label.visible = false


func _on_KneeRight_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/AOFAS.tscn")


func _on_KneeRight_mouse_entered():
	$Background/Man/KneeRight/KneeRightFill.visible = true
	$Background/Man/KneeRight/KneeRightStroke.visible = true
	$Background/Man/KneeRight/Label.visible = true


func _on_KneeRight_mouse_exited():
	$Background/Man/KneeRight/KneeRightFill.visible = false
	$Background/Man/KneeRight/KneeRightStroke.visible = false
	$Background/Man/KneeRight/Label.visible = false


func _on_KneeLeft_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Mazur.tscn")


func _on_KneeLeft_mouse_entered():
	$Background/Man/KneeLeft/KneeLeftFill.visible = true
	$Background/Man/KneeLeft/KneeLeftStroke.visible = true
	$Background/Man/KneeLeft/Label.visible = true
	

func _on_KneeLeft_mouse_exited():
	$Background/Man/KneeLeft/KneeLeftFill.visible = false
	$Background/Man/KneeLeft/KneeLeftStroke.visible = false
	$Background/Man/KneeLeft/Label.visible = false


func _on_ButtonSaveForms_pressed():
	get_tree().change_scene("res://GUI/SavingForms.tscn")


func _on_ElbowRight_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Form25.tscn")


func _on_ElbowRight_mouse_entered():
	$Background/Man/ElbowRight/ElbowRightFill.visible = true
	$Background/Man/ElbowRight/ElbowRightStroke.visible = true
	$Background/Man/ElbowRight/Label.visible = true


func _on_ElbowRight_mouse_exited():
	$Background/Man/ElbowRight/ElbowRightFill.visible = false
	$Background/Man/ElbowRight/ElbowRightStroke.visible = false
	$Background/Man/ElbowRight/Label.visible = false


func _on_ElbowLeft_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Form24.tscn")


func _on_ElbowLeft_mouse_entered():
	$Background/Man/ElbowLeft/ElbowLeftFill.visible = true
	$Background/Man/ElbowLeft/ElbowLeftStroke.visible = true
	$Background/Man/ElbowLeft/Label.visible = true


func _on_ElbowLeft_mouse_exited():
	$Background/Man/ElbowLeft/ElbowLeftFill.visible = false
	$Background/Man/ElbowLeft/ElbowLeftStroke.visible = false
	$Background/Man/ElbowLeft/Label.visible = false


func _on_AnkleJointLeft_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/AOFAS.tscn")


func _on_AnkleJointLeft_mouse_entered():
	$Background/Man/AnkleJointLeft/AnkleJointLeftFill.visible = true
	$Background/Man/AnkleJointLeft/AnkleJointLeftStroke.visible = true
	$Background/Man/AnkleJointLeft/Label.visible = true


func _on_AnkleJointLeft_mouse_exited():
	$Background/Man/AnkleJointLeft/AnkleJointLeftFill.visible = false
	$Background/Man/AnkleJointLeft/AnkleJointLeftStroke.visible = false
	$Background/Man/AnkleJointLeft/Label.visible = false


func _on_AnkleJointRight_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/AOFAS.tscn")


func _on_AnkleJointRight_mouse_entered():
	$Background/Man/AnkleJointRight/AnkleJointRightFill.visible = true
	$Background/Man/AnkleJointRight/AnkleJointRightStroke.visible = true
	$Background/Man/AnkleJointRight/Label.visible = true


func _on_AnkleJointRight_mouse_exited():
	$Background/Man/AnkleJointRight/AnkleJointRightFill.visible = false
	$Background/Man/AnkleJointRight/AnkleJointRightStroke.visible = false
	$Background/Man/AnkleJointRight/Label.visible = false



func _on_CarpalJointLeft_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Form24.tscn")


func _on_CarpalJointLeft_mouse_entered():
	$Background/Man/CarpalJointLeft/CarpalJointLeftFill.visible = true
	$Background/Man/CarpalJointLeft/CarpalJointLeftStroke.visible = true
	$Background/Man/CarpalJointLeft/Label.visible = true


func _on_CarpalJointLeft_mouse_exited():
	$Background/Man/CarpalJointLeft/CarpalJointLeftFill.visible = false
	$Background/Man/CarpalJointLeft/CarpalJointLeftStroke.visible = false
	$Background/Man/CarpalJointLeft/Label.visible = false


func _on_CarpalJointRight_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Form24.tscn")


func _on_CarpalJointRight_mouse_entered():
	$Background/Man/CarpalJointRight/CarpalJointRightStroke.visible = true
	$Background/Man/CarpalJointRight/CarpalJointRightFill.visible = true
	$Background/Man/CarpalJointRight/Label.visible = true


func _on_CarpalJointRight_mouse_exited():
	$Background/Man/CarpalJointRight/CarpalJointRightStroke.visible = false
	$Background/Man/CarpalJointRight/CarpalJointRightFill.visible = false
	$Background/Man/CarpalJointRight/Label.visible = false


func _on_HipJointLeft_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Form24.tscn")


func _on_HipJointLeft_mouse_entered():
	$Background/Man/HipJointLeft/HipJointLeftFill.visible = true
	$Background/Man/HipJointLeft/HipJointLeftStroke.visible = true
	$Background/Man/HipJointLeft/Label.visible = true


func _on_HipJointLeft_mouse_exited():
	$Background/Man/HipJointLeft/HipJointLeftFill.visible = false
	$Background/Man/HipJointLeft/HipJointLeftStroke.visible = false
	$Background/Man/HipJointLeft/Label.visible = false


func _on_HipJointRight_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.from_whose = 0
		get_tree().change_scene("res://Forms/Form24.tscn")


func _on_HipJointRight_mouse_entered():
	$Background/Man/HipJointRight/HipJointRightFill.visible = true
	$Background/Man/HipJointRight/HipJointRightStroke.visible = true
	$Background/Man/HipJointRight/Label.visible = true


func _on_HipJointRight_mouse_exited():
	$Background/Man/HipJointRight/HipJointRightFill.visible = false
	$Background/Man/HipJointRight/HipJointRightStroke.visible = false
	$Background/Man/HipJointRight/Label.visible = false
