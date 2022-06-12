extends Control

onready var text_field = $ColorRect2/Control/TextField

func set_text(value):
	text_field.text = value

func _on_X_pressed():
	queue_free()
