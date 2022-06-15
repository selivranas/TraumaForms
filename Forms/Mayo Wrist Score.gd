extends "res://Forms/Form_base.gd"

var count = 0.0

onready var name_text = $FieldFullname/InputFullname
onready var age_text = $FieldAge/InputAge

var result = 0.0


var answers = []
var form = {}
func _ready():
	if OS.get_name() == "Android":
		name_text.text = Global.global_name
		age_text.text = Global.global_age
	name = $TextureRect2/Label.text
	Global.info_text = "Модифицированная шкала запястья Мейо требует участия как пациента, так и врача для оценки боли, активной дуги сгибания/разгибания (по сравнению с контралатеральной стороной), силы захвата (по сравнению с контралатеральной стороной) и способности вернуться к обычному занятости или деятельности.\nОценки варьируются от 0 до 100, где 0 баллов указывает на худшее состояние запястья, а 100 — на лучшее состояние запястья."
	for i in range(5):
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
			current_selected = 25
		2:
			current_selected = 20
		3:
			current_selected = 15
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
			current_selected = 25
		2:
			current_selected = 20
		3:
			current_selected = 15
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
			current_selected = 25
		2:
			current_selected = 15
		3:
			current_selected = 10
		4:
			current_selected = 5
		5:
			current_selected = 0
	answers[2] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr3/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton4_item_selected(index):
	count -= answers[3]
	var current_selected = 0
	match index:
		1:
			current_selected = 25
		2:
			current_selected = 15
		3:
			current_selected = 10
		4:
			current_selected = 5
		5:
			current_selected = 0
	answers[3] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr4/Control/HBoxContainer/Control2/Header1.text = str(current_selected)

func _on_OptionButton5_item_selected(index):
	count -= answers[4]
	var current_selected = 0
	match index:
		1:
			current_selected = 25
		2:
			current_selected = 15
		3:
			current_selected = 10
		4:
			current_selected = 5
		5:
			current_selected = 0
	answers[4] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr5/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	

func _on_ButtonOk_pressed():
	var text_enter = $Description/TextDescription
	if name_text.text == "" or age_text.text == "":
		text_enter.modulate = Color("#BB3B0E")
		text_enter.text = "Не введено ФИО или возраст!"
		
	else:
		
		if count > 89:
			result = "Отлично"
		elif count > 79:
			result = "Хорошо"
		elif count > 65:
			result = "Удовлетворительно"
		else:
			result = "Плохо"
		
		
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
	
	
func create_color_rect(number):
	yield(get_tree(),"idle_frame")
	if !has_node("ScrollContainer/VBoxContainer/Parametr"+str(number)+"/ColorRect"):
		var color_rect = ColorRect.new()
		color_rect.color = Color(0.27,0.44,0.12,0.1)
		color_rect.anchor_bottom = 1
		color_rect.anchor_left = 0
		color_rect.anchor_right = 1
		color_rect.anchor_top = 0
		color_rect.margin_bottom = 0
		color_rect.margin_left = 0
		color_rect.margin_right = 0
		color_rect.margin_top = 0
		color_rect.name = "ColorRect"
		color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
		get_node("ScrollContainer/VBoxContainer/Parametr"+str(number)).add_child(color_rect)
		get_node("ScrollContainer/VBoxContainer/Parametr"+str(number)).move_child(get_node("ScrollContainer/VBoxContainer/Parametr"+str(number)+"/ColorRect"), 0)

func close_color_rect(number, is_button = false):
	if has_node("ScrollContainer/VBoxContainer/Parametr"+str(number)+"/ColorRect") and !is_button:
		get_node("ScrollContainer/VBoxContainer/Parametr"+str(number)+"/ColorRect").queue_free()


func _on_Parametr1_mouse_entered():
	create_color_rect(1)
func _on_Parametr1_mouse_exited():
	close_color_rect(1)
func _on_OptionButton1_mouse_entered():
	create_color_rect(1)
func _on_OptionButton1_mouse_exited():
	close_color_rect(1)
	
func _on_Parametr2_mouse_entered():
	create_color_rect(2)
func _on_Parametr2_mouse_exited():
	close_color_rect(2)
func _on_OptionButton2_mouse_entered():
	create_color_rect(2)
func _on_OptionButton2_mouse_exited():
	close_color_rect(2)

func _on_Parametr3_mouse_entered():
	create_color_rect(3)
func _on_Parametr3_mouse_exited():
	close_color_rect(3)
func _on_OptionButton3_mouse_entered():
	create_color_rect(3)
func _on_OptionButton3_mouse_exited():
	close_color_rect(3)

func _on_Parametr4_mouse_entered():
	create_color_rect(4)
func _on_Parametr4_mouse_exited():
	close_color_rect(4)
func _on_OptionButton4_mouse_entered():
	create_color_rect(4)
func _on_OptionButton4_mouse_exited():
	close_color_rect(4)

func _on_Parametr5_mouse_entered():
	create_color_rect(5)
func _on_Parametr5_mouse_exited():
	close_color_rect(5)
func _on_OptionButton5_mouse_entered():
	create_color_rect(5)
func _on_OptionButton5_mouse_exited():
	close_color_rect(5)
