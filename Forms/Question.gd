extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func create_color_rect():
	yield(get_tree(),"idle_frame")
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
	if !has_node("ColorRect"):
		add_child(color_rect)
		move_child(get_node("ColorRect"), 0)

func close_color_rect():
	if has_node("ColorRect"):
		get_node("ColorRect").queue_free()
