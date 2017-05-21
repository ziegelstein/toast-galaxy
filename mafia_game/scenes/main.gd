extends Control

func _ready():
	global.set_main_scene(self)
	
	pass

func _on_next_day_button_pressed():
	global.cycle_change()


func _on_TextureButton_pressed():
	var selection = get_node("blueprint_selection")
	selection.set_global_pos(get_global_pos())
	selection.popup()
	pass # replace with function body
