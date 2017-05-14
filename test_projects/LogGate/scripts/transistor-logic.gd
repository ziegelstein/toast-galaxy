extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var isPressed = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _pressed():
	if (isPressed == false):
		isPressed = true
	else:
		isPressed = false
	return isPressed

#func _set(Texture, "assets/diode1.png")


func _on_T1_toggled( pressed ):
	pass # replace with function body
