extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var modeop = 1
var parent
var child1
var child2

func _ready():
	var iT = ImageTexture.new()
	randomize()
	modeop = randi()%6+1
	# 1 = and operator; 2 = or operator; 3 = xor operator; 4 = !and operator 5 = !or operator; 6 !xor operator
	if (modeop == 1):
		iT.load("res://assets/log-and.png")
	elif (modeop == 2):
		iT.load("res://assets/log-or.png")
	elif (modeop == 3):
		iT.load("res://assets/log-xor.png")
	elif (modeop == 4):
		iT.load("res://assets/log-not-and.png")
	elif (modeop == 5):
		iT.load("res://assets/log-not-or.png")
	elif (modeop == 6):
		iT.load("res://assets/log-not-xor.png")
	get_node("sTransistor").set_texture(iT)
	var imageSize = get_node("sTransistor").get_texture().get_size()
	var imageHeight = 52
	var imageWidth = 52
	var scale = Vector2((imageSize.x/(imageSize.x/imageWidth))/50, (imageSize.y/(imageSize.y/imageHeight))/50)
	get_node("sTransistor").set_scale(scale)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
#func _set(Texture, "assets/diode1.png")