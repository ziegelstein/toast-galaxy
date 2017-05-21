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

func create_module_blueprint():
	var general_blueprint = module_blueprint["general"]
	var build_blueprint = module_blueprint["build"]
	var resources_blueprint = module_blueprint["resources"]
	var station_stats_blueprint = module_blueprint["station_stats"]
	for i in range(general_blueprint.size()):
		if (general_blueprint[i].has("modname")):
			var modname = general_blueprint[i]["modname"]
		blueprints[i] = module_blueprint.new(i,modname,desc,spritepath,buildprice,buildtime)
		print("")
		#DoStuff
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
	
	func _init(modid,modname,desc,spritepath,buildprice,buildtime):
		self.modid = modid
		self.modname = modname
		self.desc = desc
		self.spritepath = spritepath
		self.buildprice = buildprice
		self.buildtime = buildtime
		pass
	
	func add_buildmaterials(key,value):
		buildmaterials[key]=value
	
	func add_resource(key,value):
		has_resources = true
		resources[key] = value
	
	func add_station_stats(key,value):
		has_station_stats = true
		station_stats[key] = value
	
	func has_resources():
		return has_resources
	
	func has_station_stats():
		return has_station_stats