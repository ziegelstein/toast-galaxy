extends Area2D

const MAX_WALK_SPEED = 1000
const ACCELERATION = 2500
const GRAVITY = 2000
const BREAK = 250
const JUMP_HEIGHT = 100


onready var robotSprite = get_node("robot-sprite")
onready var collisionObject = get_node("CollisionPolygone")
onready var physicBody = get_node("RobotBody2D")
var motion = Vector2(0,0)
var onGround = true

var tile_settings = {
is_fixed = false,
is_solid = true,
is_destroyable = false,
is_flameble = false,
is_inflameble = false, #is_destroyable + is_flameble
is_moveble = true,
is_hook = false,
is_interactive = false
}

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	if(Input.is_action_pressed("move_right")):
		motion.x += ACCELERATION*delta
		if(motion.x > MAX_WALK_SPEED):
			motion.x = MAX_WALK_SPEED
	elif(Input.is_action_pressed("move_left")):
		motion.x -= ACCELERATION*delta
		if(motion.x < -MAX_WALK_SPEED):
			motion.x = -MAX_WALK_SPEED
	
	if(motion.x > 0):
		motion.x -= BREAK*delta
	elif(motion.x < 0):
		motion.x += BREAK*delta
		
	motion.y += GRAVITY*delta
	
	if(physicBody.is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		if(n.y < 0):
			onGround = true
		else:
			onGround = false
	set_pos(motion*delta)
	
func _input(event):
	if(event.is_action("move_jump") && event.is_pressed() && !event.is_echo() ):
		motion.y = -JUMP_HEIGHT
		onGround = false