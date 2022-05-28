extends "res://Forms/Form_base.gd"

var count = 0.0

onready var name_text = $FieldFullname/InputFullname
onready var age_text = $FieldAge/InputAge

var result = 0.0


var answers = []
var form = {}
func _ready():
	for i in range(9):
		answers.append(0)
		var question = get_node("ScrollContainer/VBoxContainer/Parametr"+str(i+1)+"/Control/HBoxContainer/Control/OptionButton")
		question.connect("item_selected",self,"_on_OptionButton"+str(i+1)+"_item_selected")
		#call_deferred("_on_OptionButton"+str(i+1)+"_item_selected", 1)
	if Global.choosing_data_row != -1:
		pass
	

func _on_OptionButton1_item_selected(index):
	count -= answers[0]
	var current_selected = 0
	match index:
		1:
			current_selected = 40
		2:
			current_selected = 30
		3:
			current_selected = 20
		4:
			current_selected = 0
	answers[0] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr1/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton2_item_selected(index):
	count -= answers[1]
	var current_selected = 0
	match index:
		1:
			current_selected = 10
		2:
			current_selected = 7
		3:
			current_selected = 4
		4:
			current_selected = 0
	answers[1] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr2/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton3_item_selected(index):
	count -= answers[2]
	var current_selected = 0
	match index:
		1:
			current_selected = 5
		2:
			current_selected = 4
		3:
			current_selected = 2
		4:
			current_selected = 0
	answers[2] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr3/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton4_item_selected(index):
	count -= answers[3]
	var current_selected = 0
	match index:
		1:
			current_selected = 5
		2:
			current_selected = 3
		3:
			current_selected = 0
	answers[3] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr4/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton5_item_selected(index):
	count -= answers[4]
	var current_selected = 0
	match index:
		1:
			current_selected = 8
		2:
			current_selected = 4
		3:
			current_selected = 0
	answers[4] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr5/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton6_item_selected(index):
	count -= answers[5]
	var current_selected = 0
	match index:
		1:
			current_selected = 8
		2:
			current_selected = 4
		3:
			current_selected = 0
	answers[5] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr6/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton7_item_selected(index):
	count -= answers[6]
	var current_selected = 0
	match index:
		1:
			current_selected = 6
		2:
			current_selected = 3
		3:
			current_selected = 0
	answers[6] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr7/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton8_item_selected(index):
	count -= answers[7]
	var current_selected = 0
	match index:
		1:
			current_selected = 8
		2:
			current_selected = 0
	answers[7] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr8/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton9_item_selected(index):
	count -= answers[8]
	var current_selected = 0
	match index:
		1:
			current_selected = 10
		2:
			current_selected = 8
		3:
			current_selected = 0
	answers[8] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr9/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	

func _on_ButtonOk_pressed():
	var text_enter = $Description/TextDescription
	if name_text.text == "" or age_text.text == "":
		text_enter.modulate = Color("#BB3B0E")
		text_enter.text = "Не введено ФИО или возраст!"
		
	else:
		
		if count > 74:
			result = "Хорошо"
		elif count > 50:
			result = "Удовлетворительно"
		else:
			result = "Неудовлетворительно"
		
		
		var is_fail = false
		for i in range(len(answers)):
			var check = get_node("ScrollContainer/VBoxContainer/Parametr"+str(i+1)+"/Control/HBoxContainer/Control/OptionButton").selected
			if check != 0:
				form["Q"+str(i+1)] = check
			else:
				form["Q"+str(i+1)] = check
				result = "Некорректное заполнение формы. Пожалуйста, заполните все параметры"
				is_fail = true
		if !is_fail:
			text_enter.text = "Результат: %s (%d б.)" % [result, count]
			text_enter.modulate = Color(1,1,1,1)
			complete_form()
		else:
			text_enter.text = result

func complete_form():
	Global.form_complete["Анкета"] = name
	Global.form_complete["Дата заполнения"] = OS.get_unix_time()
	Global.form_complete["ФИО пациента"] = name_text.text
	Global.form_complete["Возраст пациента"] = age_text.text
	Global.form_complete["Результат"] = "%s (%.1f б.)" % [result, count]
	Global.form_complete["Форма"] = form
	print(Global.form_complete)
