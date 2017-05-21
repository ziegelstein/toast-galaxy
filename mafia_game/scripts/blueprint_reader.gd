extends Node

var module_blueprints = {} #read-in var for all parsed blueprints
var blueprints = {} #Catalog of all blueprints
var warning_messages = "" # Messages that indicates a warning
var error_messages = ""# Messages that indicates a error

func _ready():
	read_blueprint()
	if warning_messages.size() < 0:
		global.add_message(("Warnung: " + warning_messages))
	if error_messages.size() < 0:
		global.add_message(("Fehler: " + error_messages))
	pass
	
func read_blueprint():
	self.module_blueprints = global.module_blueprints
	pass

class module_blueprint:
	# General Vars
	var modid = -1
	var modname = ""
	var desc = ""
	var spritepath = "res://assets/freierBauplatz.png"
	# Build Vars
	var buildprice = 0
	var buildtime = 0
	var buildmaterials = {}
	# Resources Var
	var has_resources = false
	var resources = {}
	# station_stat var
	var has_station_stats = false
	var station_stats = {}
	
	func add_resource(key,value):
		has_resources = true
		resources =
	
	func has_resources():
		return has_resources
	
	func has_station_stats():
		return has_station_stats