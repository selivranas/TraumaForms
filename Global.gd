extends Node

var form_complete = {}
var from_whose = 0

var header = []
var getting_data = []

var chapter = ["1. Верхняя конечность", "2. Голеностопный сустав", "3. Кистевой сустав", "4. Кисть", "5. Коленный сустав", "6. Локтевой сустав", "7. Нижняя конечность", "8. Общее состояние здоровья", "9. Плечевой сустав", "10. Стопа", "11. Таз", "12. Тазобедренный сустав"]
var forms = []
var forms_link = []

var chapter_1 = ["DASH", "QuickDASH"]
var chapter_1_link = ["res://Forms/DASH.tscn", "res://Forms/QuickDASH.tscn"]
var chapter_2 = ["Шкала AOFAS", "Шкала Mazur"]
var chapter_2_link = ["res://Forms/AOFAS.tscn", "res://Forms/Mazur.tscn"]
var chapter_3 = ["Шкала Майя"]
var chapter_3_link = ["res://Forms/Mayo Wrist Score.tscn"]
var chapter_4 = ["Бостонский опросник по карпальному каналу", "Ванкуверская шкала оценки рубцов", "Опросник Gilberts при болезни Нотта"]
var chapter_4_link = ["res://Forms/SSS&FSS.tscn", "res://Forms/VSS.tscn", "res://Forms/Gilberts.tscn"]
var chapter_5 = ["Опросник KOOS", "Шкала IKDS 2000", "Шкала Lisholm"]
var chapter_5_link = ["res://Forms/Form10.tscn", "res://Forms/Form5.tscn", "res://Forms/Form9.tscn"]
var chapter_6 = ["Индекс Мейо"]
var chapter_6_link = ["res://Forms/Form11.tscn"]
var chapter_7 = ["Функциональная шкала нижней конечности LEFS"]
var chapter_7_link = ["res://Forms/Form12.tscn"]
var chapter_8 = ["Анкета оценки качества жизни SF-36"]
var chapter_8_link = ["res://Forms/Form14.tscn"]
var chapter_9 = ["Шкала Constant", "Шкала оценки функции плечевого сустава Университета Калифорнии"]
var chapter_9_link = ["res://Forms/Form16.tscn", "res://Forms/Form17.tscn"]
var chapter_10 = ["Критерии Groulier", "Московская шкала оценки функции стопы после травмы", "Сокращенный опросник субъективной оценки", "Шкала оценки заднего отдела стопы", "Шкала оценки переднего отдела стопы", "Шкала оценки среднего отдела стопы", "Шкала оценки функции стопы FFI"]
var chapter_10_link = ["res://Forms/Form20.tscn", "res://Forms/Form20.tscn", "res://Forms/Form20.tscn", "res://Forms/Form20.tscn", "res://Forms/Form20.tscn", "res://Forms/Form20.tscn", "res://Forms/Form20.tscn"]
var chapter_11 = ["Шкала Majeed"]
var chapter_11_link = ["res://Forms/Form21.tscn"]
var chapter_12 = ["Harris Hip Score"]
var chapter_12_link = ["res://Forms/Form25.tscn"]

var choosing_data_row = -1

var info_text = ""

func _ready():
	forms = [chapter_1, chapter_2, chapter_3, chapter_4, chapter_5, chapter_6, chapter_7, chapter_8, chapter_9, chapter_10, chapter_11, chapter_12]
	forms_link = [chapter_1_link, chapter_2_link, chapter_3_link, chapter_4_link, chapter_5_link, chapter_6_link, chapter_7_link, chapter_8_link, chapter_9_link, chapter_10_link, chapter_11_link, chapter_12_link]

func save_file(file_name = Global.form_complete["Анкета"] + ".csv", enter_dict = form_complete):
	var f = File.new()
	if f.file_exists("user://" + file_name):
		f.open("user://" + file_name, File.READ_WRITE)
		f.seek_end()
		var entered_values = ""
		for k in enter_dict.keys():
			if k != "Форма":
				entered_values+= str(enter_dict[k])+";"
			else:
				for k_form in enter_dict[k].keys():
					entered_values += str(enter_dict[k][k_form]) + ";"
		f.store_line(entered_values)
		f.close()
	else:
		f.open("user://" + file_name, File.WRITE)
		var entered_string = ""
		var entered_values = ""
		for k in enter_dict.keys():
			if k != "Форма":
				entered_string += k + ";"
			else:
				for k_form in enter_dict[k].keys():
					entered_string += k_form + ";"
		for k in enter_dict.keys():
			if k != "Форма":
				entered_values+= str(enter_dict[k])+";"
			else:
				for k_form in enter_dict[k].keys():
					entered_values += str(enter_dict[k][k_form]) + ";"
		f.store_line(entered_string+"\n"+entered_values)
		#f.store_string("test")
		f.close()
		
func load_file(file_name):
	var f = File.new()
	file_name += ".csv"
	getting_data = []
	if f.file_exists("user://" + file_name):
		f.open("user://" + file_name, File.READ)
		header = f.get_line().split(";")
		while f.get_position() < f.get_len():
			var line = f.get_line().split(";")
			var file_data = {}
			var check_form = false
			for i in range(len(header)):
				if line[i] == "Q1":
					file_data["Форма"] = {}
					check_form = true
				if check_form:
					file_data["Форма"][header[i]] = line[i]
				else:
					file_data[header[i]] = line[i]
			getting_data.append(file_data)
		f.close()
		return true
	else:
		return false
