extends Control

var resource_display_class = load("res://gui/resource_display.tscn")

func _ready():
	#Load resource_displays
	var resources = global.get_resources()
	for key in resources:
		var display = resource_display_class.instance()
		display.set_resource_name(key)
		get_node("left_panel/resources").add_child(display)
		display.update()
	
	get_node("left_panel/message_log").add_text("Tag 30: Geld an Don bezahlt.\n")
	get_node("left_panel/message_log").add_text("Tag 31: döner mit alles")
	pass


func _on_next_day_button_pressed():
	pass #	global.cycle_change()
