extends "res://Forms/Form_base.gd"

var count = 0.0
var total_quest = 0
var missing_quest = 0

var result = 0.0

onready var check_text_info = $Control/Description/TextDescription

var form = {}

func _ready():
	name = $TextureRect2/Label.text
	Global.info_text = "Болезнь Нотта (стенозирующий лигаментит) — заболевание опорно-двигательной системы, способное приводить к полному обездвиживанию пальца. Jпросник Gilberts создан для оценки отдаленных результатов лечения."
	if Global.choosing_data_row != -1:
		var check_data = Global.getting_data[Global.choosing_data_row]
		$Control/FieldFullname/InputFullname.text = check_data["ФИО пациента"]
		$Control/FieldAge/InputAge.text = check_data["Возраст пациента"]
		for i in range(6):
			var quest = get_node("Control/ScrollContainer/VBoxContainer/Question" + str(i+1))
			var btn1 = quest.get_node("Control/HBoxContainer/Control1/CheckBox1")
			var btn2 = quest.get_node("Control/HBoxContainer/Control2/CheckBox2")
			var chech_num_answer = int(check_data["Q" + str(i+1)])
			if chech_num_answer == 1:
				btn1.pressed = true
			elif chech_num_answer == 2:
				btn2.pressed = true

	for i in range(6):
		var quest = get_node("Control/ScrollContainer/VBoxContainer/Question" + str(i+1))
		var btn1 = quest.get_node("Control/HBoxContainer/Control1/CheckBox1")
		var btn2 = quest.get_node("Control/HBoxContainer/Control2/CheckBox2")
		quest.set_script(preload("res://Forms/Question.gd"))
		btn1.set_script(preload("res://Forms/CheckBoxCode.gd"))
		btn2.set_script(preload("res://Forms/CheckBoxCode.gd"))

		quest.connect("mouse_entered", quest, "create_color_rect")
		quest.connect("mouse_exited", quest, "close_color_rect")
		btn1.connect("mouse_entered", btn1, "create_color_rect")
		btn1.connect("mouse_exited", btn1, "close_color_rect")
		btn2.connect("mouse_entered", btn2, "create_color_rect")
		btn2.connect("mouse_exited", btn2, "close_color_rect")

func _process(delta):
	pass
	#$Control/ScrollContainer/VBoxContainer.rect_min_size.x = $Control/ScrollContainer/VBoxContainer/TableHeader/Control/HBoxContainer.rect_size.x

func resized():
	for i in range(30):
		var quest = get_node("Control/ScrollContainer/VBoxContainer/Question" + str(i+1) + "/Control/HBoxContainer")
		for j in range(5):
			if j == 0:
				quest.get_node("Control").rect_min_size.x = get_node("Control/ScrollContainer/VBoxContainer/TableHeader/Control/HBoxContainer/Control/Header1").rect_size.x
			else:
				quest.get_node("Control" + str(j+1)).rect_min_size.x = get_node("Control/ScrollContainer/VBoxContainer/TableHeader/Control/HBoxContainer/Control" + str(j+1) + "/Header1").rect_size.x
		var label = get_node("Control/ScrollContainer/VBoxContainer/Question" + str(i+1))
		label.get_node("Label").rect_size.x = (750 if label.get_node("Label").rect_size.x != 750 else 351)

func _on_ButtonOk_pressed():
	count = 0.0
	total_quest = 0
	missing_quest = 0
	result = 0.0
	
	for i in range(6):
		var quest = get_node("Control/ScrollContainer/VBoxContainer/Question" + str(i+1) + "/Control/HBoxContainer")
		var btn1 = quest.get_node("Control1/CheckBox1")
		var btn2 = quest.get_node("Control2/CheckBox2")

		if btn1.pressed:
			total_quest+=1
			form["Q%d" % (i+1)] = "1"
		elif btn2.pressed:
			count+=2
			total_quest+=1
			form["Q%d" % (i+1)] = "2"
		else:
			missing_quest+=1
			form["Q%d" % (i+1)] = "0"
	if $Control/FieldFullname/InputFullname.text == "" or $Control/FieldAge/InputAge.text == "":
		check_text_info.text = "Не введено ФИО или возраст!"
		check_text_info.modulate = Color("#BB3B0E")
	else:
		if missing_quest == 0:
			result = "Успешно"
			check_text_info.text = result
			check_text_info.modulate = Color(1, 1, 1, 1)
			complete_form()
		else:
			check_text_info.text = "Вы пропустили более одного вопроса!"
			check_text_info.modulate = Color("#BB3B0E")

func complete_form():
	Global.form_complete["Анкета"] = name
	Global.form_complete["Дата заполнения"] = OS.get_unix_time()
	Global.form_complete["ФИО пациента"] = $Control/FieldFullname/InputFullname.text
	Global.form_complete["Возраст пациента"] = $Control/FieldAge/InputAge.text
	Global.form_complete["Результат"] = result
	Global.form_complete["Форма"] = form
	
