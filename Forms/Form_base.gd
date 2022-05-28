extends Control

onready var options_menu =  $Control2
onready var header = $TextureRect2/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	#header.text = name
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	if Global.from_whose == 0:
		get_tree().change_scene("res://GUI/MainTraumaScene.tscn")
	elif Global.from_whose == 1:
		get_tree().change_scene("res://GUI/ListTraumaScene.tscn")


func _on_TextureButton2_pressed():
	if options_menu.visible:
		options_menu.visible = false
	else:
		options_menu.visible = true
		options_menu.start_visible()

func complete_form():
	Global.form_complete["Анкета"] = "Undef"
	Global.form_complete["Дата заполнения"] = OS.get_unix_time()
	Global.form_complete["ФИО пациента"] = ""
	Global.form_complete["Возраст пациента"] = ""
	Global.form_complete["Результат"] = 0
	Global.form_complete["Форма"] = {}

