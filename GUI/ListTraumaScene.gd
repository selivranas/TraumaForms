extends Control

onready var placement_forms_name = $Background/ScrollContainer/VBoxContainer
var form_name = preload("res://GUI/Form_name.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var chapter = Global.chapter
	var forms = Global.forms
	var forms_link = Global.forms_link
	for i in range(len(chapter)):
		var label_name = form_name.instance()
		label_name.text = chapter[i]
		placement_forms_name.add_child(label_name)
		for j in range(len(forms[i])):
			var label_name_form = form_name.instance()
			label_name_form.text = "    • "+forms[i][j]
			label_name_form.set_link_text(forms_link[i][j])
			placement_forms_name.add_child(label_name_form)
	


func _on_ButtonBack_pressed():
	get_tree().change_scene("res://GUI/MainTraumaScene.tscn")
