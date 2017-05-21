extends Control

func _ready():
	global.set_main_scene(self)
	
	pass

func _on_next_day_button_pressed():
	global.cycle_change()


func _on_blueprint_selection_button_pressed():
	var selection = get_node("blueprint_selection")
	var button = get_node("blueprint_selection_button")
	selection.set_global_pos(button.get_global_pos())
	selection.popup()
	pass # replace with function body
