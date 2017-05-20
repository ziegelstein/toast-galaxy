extends Node

var current_scene = null

var messages = []
var modules = []
var resources = {} setget , get_resources
var station_stats = {"Angriff":0, "Verteidigung":0, "Popularitaet":0, "Verdaechtigkeit":0, "Geld":1} setget , get_station_stats
## ToDo Add a dict for "other" items like the cycles or quest variables
var cycle = 0 # Number of "Days"
var metacycles = 0 #Number of "Months"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() - 1 )

func get_resources():
	return resources

func set_resource(key, value):
	if resources.has(key):
		resources[key] = value
		return true
	return false
	
func add_resource(key, value):
	resources[key] = value
	pass

func get_resource(key):
	if (resources.has(key)):
		return resources[key]
	return null #Should throw an error

func get_station_stats():
	return station_stats

func get_station_stat(key):
	if (station_stats.has(key)):
		return station_stats[key]
	return null #Should throw an error
	
func set_station_stat(key, value):
	if (station_stats.has(key)):
		station_stats[key]=value
		return true
	return false

func add_station_stat(key, value):
	station_stats[key]=value
	pass
	
func add_module(module):
	if (modules.has(module) == false):
		modules.append(module)
		return true
	add_message("Fehler: Dupliziertes Modul!")
	return false
	
func remove_module(module):
	modules.remove(module)
	pass



# Some message functions for central logging and message sending

func get_messages():
	return messages

func get_last_messege():
	return messages[messages.size()-1]
	
func add_message(message):
	if (message.length() != 0):
		messages.append(message)
	pass

func add_messages(messagearray):
	if (messagearray.size() != 0):
		for message in messagearray:
			messages.append(message)
	pass

# Functions for the cycle change:

func get_cycles_of_metacycle():
	# Returns the Cycles of the current metacycle
	return cycle - (30*metacycles)

func cycle_change():
	cycle = cycle + 1
	if (get_cycles_of_metacycle() > 30):
		metacycles = metacycles + 1
		add_message("Der Don hat sich seinen Anteil genommen")
		##ToDo Add some more fancy interaction
		station_stats["Geld"] = station_stats["Geld"] - 1000
	##ToDo Add a Loop that calls every "daily module methode"
	for mod in modules:
		if(mod.has_method("daily")):
			mod.daily()
	##ToDo Generate some Day variables, the general activity for example
	##ToDo Add a "Draw an Event"
	##ToDo Think about other stuff that happen around cycle change
	pass