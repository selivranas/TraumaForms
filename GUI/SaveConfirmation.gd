extends Control


onready var visible_timer = $Timer


func _on_Timer_timeout():
	queue_free()
