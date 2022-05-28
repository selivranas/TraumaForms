extends Control

onready var rowNumber = $HBoxContainer/NumberRow/Label
onready var rowName = $HBoxContainer/NameRow/Label
onready var rowAge = $HBoxContainer/AgeRow/Label
onready var rowDate = $HBoxContainer/DateRow/Label
onready var rowResult = $HBoxContainer/ResultRow/Label
onready var variable = $HBoxContainer/Variable/Label
onready var varButton = $HBoxContainer/Variable/ButtonBack

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_data(number, naming, age, date, result):
	rowNumber.text = str(number)
	rowName.text = str(naming)
	rowAge.text = str(age)
	rowDate.text = str(date)
	rowResult.text = str(result)
	varButton.visible = true
	variable.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonBack_pressed():
	var form_name = str(Global.getting_data[int(rowNumber.text)-1]["Анкета"])
	var form_link = ""
	for i in len(Global.forms):
		if Global.forms[i].find(form_name) != -1:
			form_link = Global.forms_link[i][Global.forms[i].find(form_name)]
	var forms = load(form_link).instance()
	Global.choosing_data_row = int(rowNumber.text)-1
	get_parent().get_parent().get_parent().get_parent().add_child(forms)
	
