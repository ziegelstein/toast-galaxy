extends KinematicBody2D

const MAX_WALK_SPEED = 200
const ACCELERATION = 500
const GRAVITY = 98
const BREAK = 250
const JUMP_HEIGHT = 100

var motion = Vector2(0,0)
var onGround = true

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
	
	if(is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		if(n.y < 0):
			onGround = true
		else:
			onGround = false
	move(motion*delta)
	
func _input(event):
	if(event.is_action("move_jump") && event.is_pressed() && !event.is_echo() ):
		motion.y = -JUMP_HEIGHT
		onGround = false