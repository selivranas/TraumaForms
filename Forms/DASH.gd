extends "res://Forms/Form_base.gd"

var count = 0.0
var total_quest = 0
var missing_quest = 0

var result = 0.0

onready var check_text_info = $Description/TextDescription

var form = {}

func _ready():
	Global.info_text = "Согласно решению II Съезда Общества кистевых хирургов РФ (15-17 мая, 2008, Россия, Санкт-Петербург) для единой оценки отдаленных результатов лечения пальцев и кисти в РФ предложено пользоваться валидной русской версией органоспецифического опросника: Опросник исходов и неспособности руки и кисти - Disability of the Arm, Shoulder and Hand Outcome Measure - DASH.\n\nШкала DASH неспособности/симптомов = ((сумма n ответов/n)-1)*25, где n равно количеству ответов"
	set_font(self)
	if Global.choosing_data_row != -1:
		pass
	get_viewport().connect("size_changed", self, "resized")
	#Перенести в отдельный скрипт в поле на автоподвязку и в кнопку на обработку наведения мыши
	for i in range(30):
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
	
func _process(delta):
	$ScrollContainer/VBoxContainer.rect_min_size.x = $TableHeader/HBoxContainer.rect_size.x

func resized():
	for i in range(30):
		var quest = get_node("ScrollContainer/VBoxContainer/Question" + str(i+1) + "/Control/HBoxContainer")
		for j in range(5):
			if j == 0:
				quest.get_node("Control").rect_min_size.x = get_node("TableHeader/HBoxContainer/Header2").rect_size.x
			else:
				quest.get_node("Control" + str(j+1)).rect_min_size.x = get_node("TableHeader/HBoxContainer/Header" + str(j+1)).rect_size.x
		var label = get_node("ScrollContainer/VBoxContainer/Question" + str(i+1))
		label.get_node("Label").rect_size.x = (750 if label.get_node("Label").rect_size.x != 750 else 351)

func _on_ButtonOk_pressed():
	count = 0.0
	total_quest = 0
	missing_quest = 0
	result = 0.0
	
	for i in range(30):
		var quest = get_node("ScrollContainer/VBoxContainer/Question" + str(i+1) + "/Control/HBoxContainer")
		var btn1 = quest.get_node("Control/CheckBox1")
		var btn2 = quest.get_node("Control2/CheckBox2")
		var btn3 = quest.get_node("Control3/CheckBox2")
		var btn4 = quest.get_node("Control4/CheckBox2")
		var btn5 = quest.get_node("Control5/CheckBox2")
		if btn1.pressed:
			count+=1
			total_quest+=1
			form["Q%d" % (i+1)] = "1"
		elif btn2.pressed:
			count+=2
			total_quest+=1
			form["Q%d" % (i+1)] = "2"
		elif btn3.pressed:
			count+=3
			total_quest+=1
			form["Q%d" % (i+1)] = "3"
		elif btn4.pressed:
			count+=4
			total_quest+=1
			form["Q%d" % (i+1)] = "4"
		elif btn5.pressed:
			count+=5
			total_quest+=1
			form["Q%d" % (i+1)] = "5"
		else:
			missing_quest+=1
			form["Q%d" % (i+1)] = "0"
	if $FieldFullname/InputFullname.text == "" or $FieldAge/InputAge.text == "":
		check_text_info.text = "Не введено ФИО или возраст!"
		check_text_info.modulate = Color("#BB3B0E")
	else:
		if missing_quest <= 3:
			result = ((count/total_quest)-1)*25
			check_text_info.text = "Успешно\nСумма баллов: %.1f" % result
			check_text_info.modulate = Color(1, 1, 1, 1)
			#form["Result"] = "%.1f" % result
			complete_form()
		else:
			check_text_info.text = "Результат невозможно подсчитать, Вы пропустили более трех вопросов"
			check_text_info.modulate = Color("#BB3B0E")

func complete_form():
	Global.form_complete["Анкета"] = "DASH"
	Global.form_complete["Дата заполнения"] = OS.get_unix_time()
	Global.form_complete["ФИО пациента"] = $FieldFullname/InputFullname.text
	Global.form_complete["Возраст пациента"] = $FieldAge/InputAge.text
	Global.form_complete["Результат"] = "%.1f" % result
	Global.form_complete["Форма"] = form

func set_font(obj):
	obj.theme = Theme.new()
	obj.theme.default_font = DynamicFont.new()
	obj.theme.default_font.font_data = load("res://Source/OpenSans-Regular.ttf")
	obj.theme.default_font.size = 12
