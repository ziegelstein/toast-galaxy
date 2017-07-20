extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var input
var output
var sig = false

func _ready(inp, outp):
	input = inp
	outp = outp
	# Called every time the node is added to the scene.
	# Initialization here
	
func toggle_sig():
	if (sig == false):
		sig = true
	else:
		sig = false
	return true

func set_signal(booldata):
	sig = booldata
	return true
	
func get_signal():
	return sig