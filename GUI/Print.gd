extends Control

onready var text_edit = $Control/RichTextLabel

var text = ""
func _ready():
	text += "		%s\n\n" % Global.form_complete["Анкета"]
	for i in Global.form_complete:
		if i != "Анкета" and i != "Форма":
			if i == "Дата заполнения":
				var datetime = OS.get_datetime_from_unix_time(Global.form_complete[i])
				text += "%s - %s.%s.%s %s:%s:%s\n" % [i, datetime["day"], datetime["month"], datetime["year"], datetime["hour"], datetime["minute"], datetime["second"]]
			else:
				text += "%s - %s\n" % [i, Global.form_complete[i]]
	text += "\n		____________		_______________\n"
	text += "			Дата				Подпись\n"
	text_edit.text = text

func _on_TextureButton_pressed():
	queue_free()
