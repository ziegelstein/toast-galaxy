extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var screen_size;
var alive setget setAlive,isAlive;
 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	alive = true;
	screen_size = get_viewport_rect().size;

func set_pos(pos):
	get_node("projectile").set_pos(pos);
	
func setAlive(alive):
	alive = alive;

func isAlive():
	return alive;