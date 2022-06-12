extends "res://Forms/Form_base.gd"


var count = 0.0

onready var name_text = $FieldFullname/InputFullname
onready var age_text = $FieldAge/InputAge

var result = 0.0


var answers = []
var form = {}
func _ready():
	Global.info_text = "Шкала Mazur для оценки результатов лечения переломов пилона.\n\nИнтерпретация результатов:\n80-100 баллов – отлично;\n0-79 баллов – хорошо;\n60-69 баллов – удовлетворительно;\nменее 60 баллов - плохо."
	for i in range(12):
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
			current_selected = 50
		2:
			current_selected = 45
		3:
			current_selected = 40
		4:
			current_selected = 25
		5:
			current_selected = 10
		6:
			current_selected = 0
	answers[0] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr1/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton2_item_selected(index):
	count -= answers[1]
	var current_selected = 0
	match index:
		1:
			current_selected = 6
		2:
			current_selected = 4
		3:
			current_selected = 2
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
			current_selected = 6
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
			current_selected = 3
		2:
			current_selected = 2
		3:
			current_selected = 1
		4:
			current_selected = 0
	answers[3] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr4/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	

func _on_OptionButton5_item_selected(index):
	count -= answers[4]
	var current_selected = 0
	match index:
		1:
			current_selected = 3
		2:
			current_selected = 2
		3:
			current_selected = 1
		4:
			current_selected = 0
	answers[4] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr5/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton6_item_selected(index):
	count -= answers[5]
	var current_selected = 0
	match index:
		1:
			current_selected = 3
		2:
			current_selected = 2
		3:
			current_selected = 1
		4:
			current_selected = 0
	answers[5] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr6/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	
	
func _on_OptionButton7_item_selected(index):
	count -= answers[6]
	var current_selected = 0
	match index:
		1:
			current_selected = 5
		2:
			current_selected = 3
		3:
			current_selected = 1
		4:
			current_selected = 0
	answers[6] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr7/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton8_item_selected(index):
	count -= answers[7]
	var current_selected = 0
	match index:
		1:
			current_selected = 5
		2:
			current_selected = 3
		3:
			current_selected = 0
	answers[7] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr8/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	
	
func _on_OptionButton9_item_selected(index):
	count -= answers[8]
	var current_selected = 0
	match index:
		1:
			current_selected = 6
		2:
			current_selected = 4
		3:
			current_selected = 2
		4:
			current_selected = 1
		5:
			current_selected = 0
	answers[8] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr9/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton10_item_selected(index):
	count -= answers[9]
	var current_selected = 0
	match index:
		1:
			current_selected = 6
		2:
			current_selected = 5
		3:
			current_selected = 3
		4:
			current_selected = 1
		5:
			current_selected = 0
	answers[9] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr10/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	
	
func _on_OptionButton11_item_selected(index):
	count -= answers[10]
	var current_selected = 0
	match index:
		1:
			current_selected = 5
		2:
			current_selected = 4
		3:
			current_selected = 3
		4:
			current_selected = 2
		5:
			current_selected = 1
		6:
			current_selected = 0
	answers[10] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr11/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton12_item_selected(index):
	count -= answers[11]
	var current_selected = 0
	match index:
		1:
			current_selected = 5
		2:
			current_selected = 4
		3:
			current_selected = 3
		4:
			current_selected = 2
		5:
			current_selected = 1
		6:
			current_selected = 0
	answers[11] = current_selected
	count += current_selected
	$ScrollContainer/VBoxContainer/Parametr12/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_ButtonOk_pressed():
	var text_enter = $Description/TextDescription
	if name_text.text == "" or age_text.text == "":
		text_enter.modulate = Color("#BB3B0E")
		text_enter.text = "Не введено ФИО или возраст!"
		
	else:
		if count > 79:
			result = "Отлично"
		elif count > 69:
			result = "Хорошо"
		elif count > 59:
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
	
func _on_Parametr6_mouse_entered():
	create_color_rect(6)
func _on_Parametr6_mouse_exited():
	close_color_rect(6)
func _on_OptionButton6_mouse_entered():
	create_color_rect(6)
func _on_OptionButton6_mouse_exited():
	close_color_rect(6)
	
func _on_Parametr7_mouse_entered():
	create_color_rect(7)
func _on_Parametr7_mouse_exited():
	close_color_rect(7)
func _on_OptionButton7_mouse_entered():
	create_color_rect(7)
func _on_OptionButton7_mouse_exited():
	close_color_rect(7)
	
func _on_Parametr8_mouse_entered():
	create_color_rect(8)
func _on_Parametr8_mouse_exited():
	close_color_rect(8)
func _on_OptionButton8_mouse_entered():
	create_color_rect(8)
func _on_OptionButton8_mouse_exited():
	close_color_rect(8)

func _on_Parametr9_mouse_entered():
	create_color_rect(9)
func _on_Parametr9_mouse_exited():
	close_color_rect(9)
func _on_OptionButton9_mouse_entered():
	create_color_rect(9)
func _on_OptionButton9_mouse_exited():
	close_color_rect(9)
	
func _on_Parametr10_mouse_entered():
	create_color_rect(10)
func _on_Parametr10_mouse_exited():
	close_color_rect(10)
func _on_OptionButton10_mouse_entered():
	create_color_rect(10)
func _on_OptionButton10_mouse_exited():
	close_color_rect(10)
	
func _on_Parametr11_mouse_entered():
	create_color_rect(11)
func _on_Parametr11_mouse_exited():
	close_color_rect(11)
func _on_OptionButton11_mouse_entered():
	create_color_rect(11)
func _on_OptionButton11_mouse_exited():
	close_color_rect(11)
	
func _on_Parametr12_mouse_entered():
	create_color_rect(12)
func _on_Parametr12_mouse_exited():
	close_color_rect(12)
func _on_OptionButton12_mouse_entered():
	create_color_rect(12)
func _on_OptionButton12_mouse_exited():
	close_color_rect(12)
