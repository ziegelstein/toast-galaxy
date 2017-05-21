extends Node

var module_blueprints = {} #read-in var for all parsed blueprints
var blueprints = {} #Catalog of all blueprints; the key is the id of the blueprint, the value is a module_blueprint class
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
	create_module_blueprint()
	pass

func create_module_blueprint():
	var general_blueprint = module_blueprint["general"]
	var buildcosts_blueprint = module_blueprint["build"]
	var resources_blueprint = module_blueprint["resources"]
	var station_stats_blueprint = module_blueprint["station_stats"]
	for i in range(general_blueprint.size()):
		# Read In the general Vars with the read_in function
		var inread_modname = read_in(general_blueprint, i, "modname")
		var inread_desc = read_in(general_blueprint, i, "desc")
		var inread_spritepath = read_in(general_blueprint, i, "spritepath")
		var inread_buildprice = read_in(buildcosts_blueprint, i, "Baukosten")
		var inread_buildtime = read_in(buildcosts_blueprint, i, "Bauzeit")
		# Creates a new blueprint
		blueprints[i] = module_blueprint.new(i,inread_modname,inread_desc,inread_spritepath,inread_buildprice,inread_buildtime)
		# Read in all buildmaterials
		for blueprint_key in buildcosts_blueprint[i].keys():
			if (blueprint_key != "Uron" && blueprint_key != "Bauzeit"):
				blueprints[i].add_buildmaterials(buildcosts_blueprint[i][blueprint_key])
		# Read in all resources
		for blueprint_key in resources_blueprint[i].keys():
			blueprints[i].add_ressources(blueprint_key,ressources_blueprint[i][blueprint_key])
		# Read in all station_stats
		for blueprint_key in station_stats_blueprint[i].keys():
			blueprints[i].add_station_stats(blueprint_key,station_stats_blueprint[i][blueprint_key])
	pass

func read_in(blueprint, i, key):
		if (blueprint[str(i)].has(key)):
			return blueprint[str(i)][key]
		else:
			warning_messages += (" " + key + " des Modules " + str(i) + " nicht vorhanden.")
			return 0 #ToDo Need a better solution
			
func get_blueprints():
	return blueprints

func get_blueprint_by_id(id):
	# ID must be a String!
	if blueprint.has(id):
		return blueprint[id]
	else:
		error_messages += (id + " ist nicht im Katalog enthalten.")
		return null #ToDo need a better solution



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
	
	func add_resources(key,value):
		has_resources = true
		resources[key] = value
	
	func add_station_stats(key,value):
		has_station_stats = true
		station_stats[key] = value
	
	func has_resources():
		return has_resources
	
	func has_station_stats():
		return has_station_stats