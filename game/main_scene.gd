extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocity = Vector2()
var gravityDirection = Vector2(0,-1)

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	