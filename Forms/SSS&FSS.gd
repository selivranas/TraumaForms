extends "res://Forms/Form_base.gd"


var count = 0.0

onready var name_text = $FieldFullname/InputFullname
onready var age_text = $FieldAge/InputAge

var result = 0.0
var result2 = 0.0
var total_quest = 0
var missing_quest = 0


var answers = []
var form = {}
func _ready():
	if OS.get_name() == "Android":
		name_text.text = Global.global_name
		age_text.text = Global.global_age
	name = $TextureRect2/Label.text
	Global.info_text = "Шкала Mazur для оценки результатов лечения переломов пилона.\n\nИнтерпретация результатов:\n80-100 баллов – отлично;\n0-79 баллов – хорошо;\n60-69 баллов – удовлетворительно;\nменее 60 баллов - плохо."
	set_font(self)
	for i in range(11):
		answers.append(0)
		var question = get_node("ScrollContainer/VBoxContainer/Parametr"+str(i+1)+"/Control/HBoxContainer/Control/OptionButton")
		question.connect("item_selected",self,"_on_OptionButton"+str(i+1)+"_item_selected")
		#call_deferred("_on_OptionButton"+str(i+1)+"_item_selected", 1)
	if Global.choosing_data_row != -1:
		var check_data = Global.getting_data[Global.choosing_data_row]
		name_text.text = check_data["ФИО пациента"]
		age_text.text = check_data["Возраст пациента"]
		for i in range(11):
			get_node("ScrollContainer/VBoxContainer/Parametr"+str(i+1)+"/Control/HBoxContainer/Control/OptionButton").selected = int(check_data["Q" + str(i+1)])
			call_deferred("_on_OptionButton"+str(i+1)+"_item_selected", int(check_data["Q" + str(i+1)]))
		for i in range(8):
			var quest = get_node("ScrollContainer/VBoxContainer/Question" + str(i+1))
			var btn1 = quest.get_node("Control/HBoxContainer/Control/CheckBox1")
			var btn2 = quest.get_node("Control/HBoxContainer/Control2/CheckBox2")
			var btn3 = quest.get_node("Control/HBoxContainer/Control3/CheckBox2")
			var btn4 = quest.get_node("Control/HBoxContainer/Control4/CheckBox2")
			var btn5 = quest.get_node("Control/HBoxContainer/Control5/CheckBox2")
			var chech_num_answer = int(check_data["Q" + str(i+11)])
			if chech_num_answer == 1:
				btn1.pressed = true
			elif chech_num_answer == 2:
				btn2.pressed = true
			elif chech_num_answer == 3:
				btn3.pressed = true
			elif chech_num_answer == 4:
				btn4.pressed = true
			elif chech_num_answer == 5:
				btn5.pressed = true
	for i in range(8):
		var quest = get_node("ScrollContainer/VBoxContainer/Question" + str(i+1))
		var btn1 = quest.get_node("Control/HBoxContainer/Control/CheckBox1")
		var btn2 = quest.get_node("Control/HBoxContainer/Control2/CheckBox2")
		var btn3 = quest.get_node("Control/HBoxContainer/Control3/CheckBox2")
		var btn4 = quest.get_node("Control/HBoxContainer/Control4/CheckBox2")
		var btn5 = quest.get_node("Control/HBoxContainer/Control5/CheckBox2")
		quest.set_script(preload("res://Forms/Question.gd"))
		btn1.set_script(preload("res://Forms/CheckBoxCode.gd"))
		btn2.set_script(preload("res://Forms/CheckBoxCode.gd"))
		btn3.set_script(preload("res://Forms/CheckBoxCode.gd"))
		btn4.set_script(preload("res://Forms/CheckBoxCode.gd"))
		btn5.set_script(preload("res://Forms/CheckBoxCode.gd"))
		quest.connect("mouse_entered", quest, "create_color_rect")
		quest.connect("mouse_exited", quest, "close_color_rect")
		btn1.connect("mouse_entered", btn1, "create_color_rect")
		btn1.connect("mouse_exited", btn1, "close_color_rect")
		btn2.connect("mouse_entered", btn2, "create_color_rect")
		btn2.connect("mouse_exited", btn2, "close_color_rect")
		btn3.connect("mouse_entered", btn3, "create_color_rect")
		btn3.connect("mouse_exited", btn3, "close_color_rect")
		btn4.connect("mouse_entered", btn4, "create_color_rect")
		btn4.connect("mouse_exited", btn4, "close_color_rect")
		btn5.connect("mouse_entered", btn5, "create_color_rect")
		btn5.connect("mouse_exited", btn5, "close_color_rect")


func _on_OptionButton1_item_selected(index):
	result2 -= answers[0]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[0] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr1/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton2_item_selected(index):
	result2 -= answers[1]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[1] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr2/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	
	
func _on_OptionButton3_item_selected(index):
	result2 -= answers[2]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[2] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr3/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton4_item_selected(index):
	result2 -= answers[3]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[3] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr4/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	

func _on_OptionButton5_item_selected(index):
	result2 -= answers[4]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[4] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr5/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton6_item_selected(index):
	result2 -= answers[5]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[5] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr6/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	
	
func _on_OptionButton7_item_selected(index):
	result2 -= answers[6]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[6] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr7/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton8_item_selected(index):
	result2 -= answers[7]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[7] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr8/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	
	
func _on_OptionButton9_item_selected(index):
	result2 -= answers[8]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[8] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr9/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton10_item_selected(index):
	result2 -= answers[9]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[9] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr10/Control/HBoxContainer/Control2/Header1.text = str(current_selected)
	
	
func _on_OptionButton11_item_selected(index):
	result2 -= answers[10]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[10] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr11/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_OptionButton12_item_selected(index):
	result2 -= answers[11]
	var current_selected = 0
	match index:
		1:
			current_selected = 1
		2:
			current_selected = 2
		3:
			current_selected = 3
		4:
			current_selected = 4
		5:
			current_selected = 5
	answers[11] = current_selected
	result2 += current_selected
	$ScrollContainer/VBoxContainer/Parametr12/Control/HBoxContainer/Control2/Header1.text = str(current_selected)


func _on_ButtonOk_pressed():
	total_quest = 0
	missing_quest = 0
	result = 0.0
	for i in range(8):
		var quest = get_node("ScrollContainer/VBoxContainer/Question" + str(i+1) + "/Control/HBoxContainer")
		var btn1 = quest.get_node("Control/CheckBox1")
		var btn2 = quest.get_node("Control2/CheckBox2")
		var btn3 = quest.get_node("Control3/CheckBox2")
		var btn4 = quest.get_node("Control4/CheckBox2")
		var btn5 = quest.get_node("Control5/CheckBox2")
		if btn1.pressed:
			count+=1
			total_quest+=1
			form["Q%d" % (i+11)] = "1"
		elif btn2.pressed:
			count+=2
			total_quest+=1
			form["Q%d" % (i+11)] = "2"
		elif btn3.pressed:
			count+=3
			total_quest+=1
			form["Q%d" % (i+11)] = "3"
		elif btn4.pressed:
			count+=4
			total_quest+=1
			form["Q%d" % (i+11)] = "4"
		elif btn5.pressed:
			count+=5
			total_quest+=1
			form["Q%d" % (i+11)] = "5"
		else:
			missing_quest+=1
			form["Q%d" % (i+11)] = "0"
	
	if !has_node("ScrollContainer/VBoxContainer/ResConf"):
		$ScrollContainer/VBoxContainer.add_child(preload("res://Forms/ResultConfirm.tscn").instance())
	var text_enter = $ScrollContainer/VBoxContainer/ResConf
	if name_text.text == "" or age_text.text == "":
		text_enter.modulate = Color("#BB3B0E")
		text_enter.set_text_label("Не введено ФИО или возраст!")
		
	else:
		result = count
		
		var is_fail = false
		for i in range(len(answers)):
			var check = get_node("ScrollContainer/VBoxContainer/Parametr"+str(i+1)+"/Control/HBoxContainer/Control/OptionButton").selected
			if check != 0:
				form["Q"+str(i+11)] = check
			else:
				form["Q"+str(i+11)] = check
				result = "Некорректное заполнение формы. Пожалуйста, заполните все параметры"
				is_fail = true
		if !is_fail:
			text_enter.set_text_label("Результат: шкала SSS: %d (%.1f), шкала FSS: %d (%.1f)" % [result2, result2/11, result, result/8])
			text_enter.modulate = Color(1,1,1,1)
			complete_form()
		else:
			text_enter.set_text_label(result)

func complete_form():
	Global.form_complete["Анкета"] = name
	Global.form_complete["Дата заполнения"] = OS.get_unix_time()
	Global.form_complete["ФИО пациента"] = name_text.text
	Global.form_complete["Возраст пациента"] = age_text.text
	Global.form_complete["Результат"] = "SSS: %d (%.1f), FSS: %d (%.1f)" % [result2, result2/11, result, result/8]
	for i in range(11):
		form["Q"+str(i+1)] = answers[i]
	Global.form_complete["Форма"] = form
	print(Global.form_complete)
	
func set_font(obj):
	obj.theme = Theme.new()
	obj.theme.default_font = DynamicFont.new()
	obj.theme.default_font.font_data = load("res://Source/OpenSans-Regular.ttf")
	obj.theme.default_font.size = 12


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
