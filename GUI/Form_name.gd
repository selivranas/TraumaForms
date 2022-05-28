extends Label

var link_text = ""
onready var underline = $Label

func set_link_text(value):
	link_text = value
	if link_text != "":
		self.add_color_override("font_color", Color( 0, 0, 0, 1 ))

func _ready():
	if link_text != "":
		underline.add_color_override("font_color", Color( 0, 0.39, 0, 1 ))
		underline.text = "       "
		for i in range(len(text)-2):
			underline.text += "_"


func _on_Form_name_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if link_text != "":
			Global.from_whose = 1
			get_tree().change_scene(link_text)



func _on_Form_name_mouse_entered():
	if link_text != "":
		underline.visible = true


func _on_Form_name_mouse_exited():
	if link_text != "":
		underline.visible = false
