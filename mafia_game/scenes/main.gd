extends Control

func _ready():
	global.set_main_scene(self)
	
	get_node("left_panel/message_log").add_text("Tag 30: Geld an Don bezahlt.\n")
	get_node("left_panel/message_log").add_text("Tag 31: döner mit alles")
	pass

func _on_next_day_button_pressed():
	global.cycle_change()


func _on_TextureButton_pressed():
	get_node("blueprint_selection").popup()
	pass # replace with function body
