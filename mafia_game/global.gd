extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var current_scene = null

var messages = []
var resources = {} setget , get_resources
var station_stats = {"Angriff":0, "Verteidigung":0, "Popularitaet":0, "Verdaechtigkeit":0} setget , get_station_stats

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() - 1 )

func get_resources():
	return resources

func get_station_stats():
	return station_stats
	
func get_messages():
	return messages

func get_last_messege():
	return messages[messages.size()-1]
	
func add_message(message):
	messages.append(messege)
	pass

func add_messages(messagearray):
	for message in messagearray:
		messages.append(message)
	pass