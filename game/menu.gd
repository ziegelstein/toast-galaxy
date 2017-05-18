extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


#	get_tree().change_scene("res://Level.tscn")
 # replace with function body

#	get_tree().quit()
# replace with function body


func _on_VButtonArray_button_selected( button_idx ):
	if (button_idx == 0):
		get_tree().change_scene("res://Level.tscn")
	if (button_idx == 1):
		get_tree().quit()
	if (button_idx == 2):
		get_tree().change_scene("res://main_scene.tscn")
	pass # replace with function body

func _on_bMusic_toggled( pressed ):
	if (pressed == true):
		get_node("BackgroundMusic").set_paused(true)
		get_node("bMusic").set_text("Gedudel anschalten")
	else:
		get_node("BackgroundMusic").set_paused(false)
		get_node("BackgroundMusic").play(0)
		get_node("bMusic").set_text("Gedudel ausschalten")
	pass # replace with function body
