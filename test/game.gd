extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var screen_size;
var projectiles;
var enemies
var score;
var enemy_spawn;
var projectile_spawn;
var time;

const ENEMY_SPEED = 100;
const PROJECTILE_SPEED = 300;
const MAX_PROJECTILES = 3;
const MAX_ENEMIES = 5;


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screen_size = get_viewport_rect().size;
	enemy_spawn = load("res://enemy_spawn.tscn");
	projectile_spawn = load("res://projectile_spawn.tscn");
	score = 0;
	time = 0;
	projectiles = [];
	enemies = [];
	set_fixed_process(true);
	
func _fixed_process(delta):
	time += delta;
	var prob = randi()%101+1;
	#var player_rect = Rect2( get_node("left").get_pos() - player_size*0.5, player_size );
	if(prob < 70 and enemies.size()<MAX_ENEMIES):
		new_enemy();
	
	# Player Controls

	
	#Handle Enemies
	var pos;
	for en in enemies:
		pos = en.find_node("enemy").get_pos();
		if(en.isAlive() && pos.x > 0):
			pos.x += -ENEMY_SPEED * delta;
			en.find_node("enemy").set_pos(pos);
		else:
			en.queue_free();
			enemies.erase(en);
	#Handle Projectiles
	for pr in projectiles:
		pos = pr.get_node("projectile").get_pos();
		var hit = check_hit(pos);
		if(pr.isAlive() && pos.x < screen_size.x && hit == null):
			pos.x += PROJECTILE_SPEED * delta;
			pr.set_pos(pos);
		elif(hit != null):
			hit.setAlive(false);
			pr.setAlive(false);
		else:
			pr.queue_free();
			projectiles.erase(pr);

func check_hit(pr_pos):
	var en_rect;
	#for en in enemies:
		#en_rect = Rect2( en.get_node("enemy").get_pos() - player_size*0.5, player_size );
		#if(en_rect.has_point(pr_pos)):
		#	return en;
	return null

func new_enemy():
	var enemy = enemy_spawn.instance();
	add_child(enemy);
	enemies.append(enemy);
	
func get_projectiles():
	return projectiles;

func add_projectile(projectile):
	projectiles.append(projectile);
