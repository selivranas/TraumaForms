extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.get_name() == "Android":
		$FieldChoose.visible = false
		$FieldChoose2.visible = true
		$ColorRect.visible = true
	elif OS.get_name() == "Windows":
		$FieldChoose.visible = true
		$FieldChoose2.visible = false
		$ColorRect.visible = false
	#get_node("/root").handle_input_locally = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonTrauma_pressed():
	get_tree().change_scene_to(load("res://GUI/MainTraumaScene.tscn"))


func _on_ButtonOrtopedy_pressed():
	get_tree().change_scene_to(load("res://Forms/AOFAS.tscn"))


func _on_InputFullname_text_changed(new_text):
	Global.global_name = new_text


func _on_InputAge_text_changed(new_text):
	Global.global_age = new_text
