extends Node

var current_scene = null

var messages = []
var modules = []
var possible_modules = []
var resources = {} setget , get_resources
var station_stats = {"Angriff":0, "Verteidigung":0, "Popularitaet":0, "Verdaechtigkeit":0, "GeladenerLayer":1} setget , get_station_stats
## ToDo Add a dict for "other" items like the cycles or quest variables
var cycle = 1 # Number of "Days"
var metacycles = 0 #Number of "Months"

var blueprint_reader_class = preload("res://scripts/blueprint_reader.gd") #Reads the blueprints in
var global_blueprint_reader # Is the global Instance of a Blueprint reader
var resource_class = preload("res://resources/resource.gd")
var module_factory_class = preload("res://scripts/module_factory.gd")
var module_factory

var PATH_RESOURCES = "res://data/resources.csv"
var PATH_MODULES = "res://data/module_data/module"

var main_scene

func _init():
	init_resources(PATH_RESOURCES)
	init_modules(PATH_MODULES)
	module_factory = module_factory_class.new()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() - 1 )

func get_resources():
	return resources

func set_resource(key, value):
	if resources.has(key):
		resources[key].value = value
		return true
	return false
	
func add_resource(key, value):
	resources[key] = resource_class.new(key, value)
	return resources[key]

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

func get_modules():
	return modules


# Some message functions for central logging and message sending

func get_messages():
	return messages

func get_last_messege():
	return messages[messages.size()-1]
	
func add_message(message):
	if (message.length() != 0):
		messages.append(message)
	main_scene.get_node("left_panel/message_log").update()

func add_messages(messagearray):
	if (messagearray.size() != 0):
		for message in messagearray:
			add_message(message)
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
		resources["Uron"].set_value(float(resources["Uron"].get_value()) - 1000)
	##ToDo Add a Loop that calls every "on_cycle_change module methode"
	for mod in modules:
		if(mod.has_method("on_cycle_change")):
			mod.on_cycle_change()
	##ToDo Generate some Day variables, the general activity for example
	##ToDo Add a "Draw an Event"
	##ToDo Think about other stuff that happen around cycle change
	update_stats_display()
	update_resource_display()
	add_message(str("-- Tag ", get_cycles_of_metacycle(), " --"))
	pass

func init_resources(path):
	var file = File.new()
	file.open(path, file.READ)
	var line
	var i
	var tmp
	while !file.eof_reached():
		line = file.get_csv_line(";")
		if(line.size()==2):
			add_resource(line[0], line[1])
		elif(line.size()==1 and line[0]!=""):
			add_resource(line[0], 0)
		elif(line.size()>2 && line.size()%2==0):
			tmp = add_resource(line[0], line[1])
			i = 2
			while i<line.size():
				tmp.add_property(line[i],line[i+1])
				i += 2

func init_modules(path):
	var general_infos = get_line_array(path+"_general.csv")
	var buildcost_infos = get_line_array(path+"_buildcost.csv")
	var resources_infos = get_line_array(path+"_resources.csv")
	var station_stats_infos = get_line_array(path+"_station_stats.csv")
	
	var general_blueprint = {}
	var buildcost_blueprint = {}
	var resources_blueprint = {}
	var station_stats_blueprint = {}
	var i = 0
	# var mod
	var tempdict = {}
	var module_blueprints = {}
	#ToDo das Einlesen der Arrays in eine einzige Function auslagern
	while i<general_infos.size():
		if (not general_infos[i][0][0] == "#"): # Checks if the loaded line is an comment
			var j = 0
			while j < general_infos[i].size():
				tempdict[general_infos[i][j]]=general_infos[i][j+1]
				j += 2
			general_blueprint[tempdict["id"]] = tempdict
			tempdict = {}
		i += 1
	i = 0
	while i < buildcost_infos.size():
		if (not buildcost_infos[i][0][0] == "#"): # Checks if the loaded line is an comment
			var j = 0
			while j < buildcost_infos[i].size():
				tempdict[buildcost_infos[i][j]]=buildcost_infos[i][j+1]
				j += 2
			buildcost_blueprint[tempdict["id"]] = tempdict
			tempdict = {}
		i += 1
	i = 0
	while i < resources_infos.size():
		if (not resources_infos[i][0][0] == "#"): # Checks if the loaded line is an comment
			var j = 0
			while j < resources_infos[i].size():
				tempdict[resources_infos[i][j]]=resources_infos[i][j+1]
				j += 2
			resources_blueprint[tempdict["id"]] = tempdict
			tempdict = {}
		i += 1
	i = 0
	while i < station_stats_infos.size():
		if (not station_stats_infos[i][0][0] == "#"): # Checks if the loaded line is an comment
			var j = 0
			while j < station_stats_infos[i].size():
				tempdict[station_stats_infos[i][j]]=station_stats_infos[i][j+1]
				j += 2
			station_stats_blueprint[tempdict["id"]] = tempdict
			tempdict = {}
		i += 1
	module_blueprints = {"general":general_blueprint,"build":buildcost_blueprint,"resources":resources_blueprint,"station_stats":station_stats_blueprint}
	global_blueprint_reader = blueprint_reader_class.new(module_blueprints)
		# General Info
		# mod = module_class.new(general_infos[i][3], general_infos[i][1])
		# mod.set_desc(general_infos[i][5])
		# mod.spritepath = general_infos[i][7]
		# Buildcost Info
		# mod.buildprice = buildcost_infos[i][3]
		# j = 4
		# while j < buildcost_infos.size():
		#	mod.add_buildmaterial(buildcost_infos[i][j],buildcost_infos[i][j+1])
		#	j += 2
		# Resource Info
		# j=3
		# while j < resources_infos.size():
		#	mod.add_resource_change(resources_infos[i][j], resources_infos[i][j+1])
		#	j += 2
		# Station Stat Info
		# j=3
		# while j < station_stats_infos.size():
		#	mod.add_station_stat_change(station_stats_infos[i][j], station_stats_infos[i][j+1])
		#	j += 2
		#i += 1
		#possible_modules.append(mod)  #Möglicherweise Modul mit Name als Key in Dictionary packen, für leichteren Zugriff

func get_line_array(path):
	var result = []
	var file = File.new()
	file.open(path, file.READ)
	while !file.eof_reached():
		result.append(file.get_csv_line(";"))
	return result
	
func calc_resource_in_use_count(resource_name):
	var sum = 0
	var modules = get_modules()
	for i in range(modules.size()):
		var module = modules[i]
		var settings = module.get_module_settings()
		for key in settings:
			if(key == resource_name):
				sum += settings[key]
	return sum

func set_main_scene(main_scene):
	self.main_scene = main_scene
	
func update_resource_display():
	main_scene.get_node("left_panel/resources").update()
	
func update_stats_display():
	main_scene.get_node("stats").update()
	
func clear_children(node):
	var children = node.get_children()
	var count = node.get_children().size()
	for i in range(count):
		children[i].free()