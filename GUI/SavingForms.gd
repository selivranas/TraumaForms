extends Control

onready var form_list = $Background/FormList
onready var data_list = $Background/DataList/DataRow
onready var error_label = $Background/Error
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in Global.forms:
		for j in i:
			form_list.add_item(j)
	_on_FormList_item_selected(0)


func _on_FormList_item_selected(index):
	Global.choosing_data_row = -1
	error_label.visible = false
	var form_name = form_list.get_item_text(index)
	var form_link = ""
	#for i in len(Global.forms):
	#	if Global.forms[i].find(form_name) != -1:
	#		form_link = Global.forms_link[i][Global.forms[i].find(form_name)]
	#var name_data_file = form_link.split("/")[-1]
	#var checked = Global.load_file(name_data_file.split(".")[0])
	var checked = Global.load_file(form_name)
	for i in data_list.get_children():
		i.queue_free()
	if checked:
		var header = preload("res://Forms/ResultRow.tscn").instance()
		data_list.add_child(header)
		for i in len(Global.getting_data):
			var data_row = preload("res://Forms/ResultRow.tscn").instance()
			data_list.add_child(data_row)
			var name_pacient = Global.getting_data[i]["ФИО пациента"]
			var age_pacient = Global.getting_data[i]["Возраст пациента"]
			var date_pacient = OS.get_datetime_from_unix_time(int(Global.getting_data[i]["Дата заполнения"]))
			var text_date =  "%s.%s.%s %s:%s:%s" % [date_pacient["day"], date_pacient["month"], date_pacient["year"], date_pacient["hour"], date_pacient["minute"], date_pacient["second"]]
			var result_pacient = Global.getting_data[i]["Результат"]
			data_row.set_data(i+1, name_pacient, age_pacient, text_date, result_pacient)
	else:
		error_label.visible = true


func _on_ButtonBack_pressed():
	get_tree().change_scene("res://GUI/MainTraumaScene.tscn")
