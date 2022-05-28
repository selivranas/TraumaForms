extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#get_node("/root").handle_input_locally = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonTrauma_pressed():
	get_tree().change_scene_to(load("res://GUI/MainTraumaScene.tscn"))


func _on_ButtonOrtopedy_pressed():
	get_tree().change_scene_to(load("res://Forms/AOFAS.tscn"))
