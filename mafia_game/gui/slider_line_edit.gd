extends HBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _on_slider_value_changed( value ):
	get_node("line_edit").set_text(str(value))

func _on_line_edit_text_entered( text ):
	get_node("slider").set_value(float(text))

func set_value(value):
	get_node("slider").set_value(value)

func get_value(value):
	get_node("slider").get_value()
	
func set_min(value):
	get_node("slider").set_min(value)

func get_min(value):
	get_node("slider").get_min()

func set_max(value):
	get_node("slider").set_max(value)

func get_max(value):
	get_node("slider").get_max()
	
func set_step(value):
	get_node("slider").set_step(value)

func get_step(value):
	get_node("slider").get_step()