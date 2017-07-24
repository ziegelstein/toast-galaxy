extends Node

### Global VARS
var cycle_Events = [] #!ToDo Get a better name for that


func _init():
	#!ToDo Do crazy init stuff like establishing the monthly payload, the setting of time etc.
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func set_new_event(event):
	cycle_Events.append(event)
	
func do_cycle_change():
	for event in cycle_Events:
		event.execute_command()
		
func check_event(event):
	return false