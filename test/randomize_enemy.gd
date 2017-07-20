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
	var npos = Vector2(screen_size.x,randf()*screen_size.y-9);
	get_node("enemy").set_pos(npos);

func isAlive():
	return alive;
	
func setAlive(alive):
	alive = alive;