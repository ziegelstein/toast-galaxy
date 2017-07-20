extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var isActive = false

func _ready():
	pass


func _on_vDiode_pressed():	
	if (isActive == false):
		isActive = true
		get_node("lDiode").set_text("Active")
	else:
		isActive = false
		get_node("lDiode").set_text("Inactive")
	return isActive
 # replace with function body
