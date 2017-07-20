extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var screen_size;
var projectile_spawn;
var game;



const PLAYER_SPEED = 100;


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	projectile_spawn = load("res://projectile_spawn.tscn");
	screen_size = get_viewport_rect().size;
	game = get_tree().get_root().get_node("game");
	set_fixed_process(true);
	
func _fixed_process(delta):
	var left_pos = get_node("left").get_pos();
	#get_node("debug").set_text("X:"+str(left_pos.x)+"\nY:"+str(left_pos.y)+"\nTime:"+str(time));
	if(left_pos.y > 0 and Input.is_action_pressed("move_up")):
		left_pos.y += -PLAYER_SPEED * delta;
	if(left_pos.y < screen_size.y and Input.is_action_pressed("move_down")):
		left_pos.y += PLAYER_SPEED * delta;
	if(left_pos.x > 0 and Input.is_action_pressed("move_left")):
		left_pos.x += -PLAYER_SPEED * delta;
	if(Input.is_action_pressed("move_right")):
		left_pos.x += PLAYER_SPEED * delta;
	if(game.get_projectiles().size()<4 and Input.is_action_pressed("fire1")):
		shoot();
	get_node("left").set_pos(left_pos);
	

func shoot():
	var projectile = projectile_spawn.instance();
	projectile.set_pos(get_node("left").get_pos());
	add_child(projectile);
	game.add_projectile(projectile);