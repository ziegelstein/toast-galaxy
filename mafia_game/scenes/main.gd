extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("left_panel/message_log").add_text("Tag 30: Geld an Don bezahlt.\n")
	get_node("left_panel/message_log").add_text("Tag 31: döner mit alles")
	pass


func _on_next_day_button_pressed():
	pass #	global.cycle_change()
