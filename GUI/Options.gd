extends Control

var confirm_text = load("res://GUI/SaveConfirmation.tscn")

onready var visible_timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.get_name() == "Android":
		$TextureRect2/Button_print.disabled = true
		$TextureRect2/Button_print.modulate = Color(0.3,0.3,0.3,1)

func start_visible():
	visible_timer.start()


func _on_Timer_timeout():
	self.visible = false


func _on_Button_mouse_entered():
	visible_timer.stop()

func _on_Button_mouse_exited():
	visible_timer.start()


func _on_Button_print_pressed():
	get_parent().complete_form()
	var node = preload("res://GUI/Print.tscn").instance()
	get_parent().add_child(node)


func _on_Button_save_pressed():
	get_parent().complete_form()
	if Global.form_complete.keys()[-1] == "Форма":
		if len(Global.form_complete["Форма"]) != 0:
			Global.save_file()
			get_parent().add_child(confirm_text.instance())
			print("Save")
		else:
			print("Not saved")
	else:
		print("Not saved")


func _on_Button_button_pressed():
	Global.load_file("QuickDASH")
	print("???")


func _on_Button_hepl_pressed():
	print("Help")
