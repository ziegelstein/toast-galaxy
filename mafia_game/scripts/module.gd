extends Node

#Basic vars
const BUILD_SPRITE_PATH = "res://assets/freierBauplatz.png"
var id = 0
var name = "generic name"
var modname = "generic module"
var desc = "generic description"

# Meta vars
#var submodules = [] # Array of Submodules - ToDo
var module_informations = {}
var module_settings = {}

# Input / Output vars
var module_resource_changes = {}
var module_station_stats_changes = {}

#Building Variable
var buildprice = 0 # Price in Uron
var buildmaterials = {} #A Dict style [[str,int]] ->[["key",value], ["maschinen", 5], ["Waffen", 3]]
var build_time = 1 #The amount of time that is needed to build that module
var remaining_build_time = build_time
var is_build = false
var will_destroyed = false
var destroy_counter = 0

# Position vars
var position = 0 # Position of the module on the space station
# Sprite Vars
var spritepath = "res://assets/freierBauplatz.png"
var is_visible = false
var pos_vector = Vector2(0,0)
var rotation = deg2rad(0) # The rotation in degree
var mySprite

### Constructor Functions ###
func on_create(id, modname, desc):
	self.id = id
	self.modname = modname
	self.name = modname + str(number_of_same_modules()+1)
	self.desc = desc
	pass

func number_of_same_modules():
	var n = 0
	for module in global.modules:
		if (self.modname == module.get_modname()):
			n += 1
	return n

func _ready():
	mySprite = get_node("moduleSprite")
	update_sprite()
	
func update_sprite():
	var imageTexture = ImageTexture.new()
	mySprite.set_texture(imageTexture.load(spritepath))
	mySprite.set_pos(pos_vector)
	mySprite.set_rot(rotation)
	if (is_visible == false):
		mySprite.hide()
	else: mySprite.show()
	
func set_sprite(sprite_path):
	mySprite = get_node("moduleSprite")
	var imageTexture = ImageTexture.new()
	mySprite.set_texture(imageTexture.load(sprite_path))
	mySprite.set_pos(pos_vector)
	mySprite.set_rot(rotation)
	if (is_visible == false):
		mySprite.hide()
	else: mySprite.show()

func set_module_informations():
	# set possible information of the module that shall be displayed - warning: includes lot of black vodoo magic!
	# This part checks if the module is already built. If not, it displays some ressources that will be used to build that module
	if (remaining_build_time != 0):
		module_informations["Bauzeit"] = remaining_build_time
	if (is_build == false):
		module_informations["Baukosten"] = buildprice
		if (!buildmaterials.empty()):
			for key in buildmaterials.keys():
				module_informations[(key+"-Baukosten")] = buildmaterials[key]
	if (not module_resource_changes.empty()):
		for module_resource_key in module_resource_changes.keys():
			if (module_resource_changes[module_resource_key] <= 0):
				module_informations[(module_resource_key + "verbrauch")] = module_resource_changes[module_resource_key]
			else:
				module_informations[(module_resource_key + "produktion")] = module_resource_changes[module_resource_key]
	if (not module_station_stats_changes.empty()):
		for module_station_stat_key in module_station_stats_changes.keys():
			if (module_station_stats_changes[module_station_stat_key] <= 0):
				module_informations[module_station_stat_key + "belastung"] = module_station_stats_changes[module_station_stat_key]
			else:
				module_informations[module_station_stat_key + "erzeugung"] = module_station_stats_changes[module_station_stat_key]
	pass

func set_module_settings():
	# Do Logic
	pass
	
func build_module_settings():
	#Do Logic
	pass

### GUI Functions ###
func get_module_informations():
	set_module_informations()
	return module_informations

func get_module_settings():
	set_module_settings()
	return module_settings

func return_module_settings(module_settings):
	self.module_settings = module_settings
	#add Logic
	pass
	
func hide_module():
	is_visible = false
	mySprite.hide()
	

### General Getter and Setter ###
func set_name(name):
	self.name = name
	pass

func set_modname(modname):
	self.modname = modname
	pass

func set_desc(description):
	self.desc = description
	pass

func get_name():
	return name
	
func get_modname():
	return modname

func get_desc():
	return desc

func get_sprite():
	return mySprite
	
func add_buildmaterial(key, value):
	buildmaterials[key] = value

func add_resource_change(key, value):
	module_resource_changes[key] = value

func add_station_stats_change(key, value):
	module_station_stats_changes[key] = value

### Building Functions ###
func add_submodule():
	pass

func is_build_possible():
	# Checks if all requierements for the module to build are met
	if (int(global.get_resource("Uron").get_value()) >= buildprice):
		for key in buildmaterials.keys():
			if (global.get_resource(key).get_value() < buildmaterials[key]):
				return false
				##ToDo Add requierement for research
		return true
	return false

func on_build(sprite_path, position, pos_vector, rotation):
	#build the module
	if (is_build_possible()):
		global.get_resource("Uron").set_value(int(global.get_resource("Uron").get_value()) - buildprice)
		for key in buildmaterials.keys():
			var value = global.get_resource(key).get_value() - buildmaterials[key]
			global.set_resource(key, value)
		self.spritepath = sprite_path
		self.position = position
		self.pos_vector = pos_vector
		self.rotation = rotation
		##ToDo Add a "In Construction" Sprite
		set_sprite(BUILD_SPRITE_PATH)
		global.add_message("Modul " + name + " wird gebaut.")
		return register_module()
	return false
	
func destroy_module(cycles):
	# Destroy the module
	if (cycles <= 0):
		# If the the cycles that are needed to destroy the module are zero, the module is instantly destroyed
		global.remove_module(self)
		global.add_message("Modul "+ name +" wurde zerstört.")
	elif will_destroyed == false:
		##ToDo Add a "Will be destroyed" Sprite
		will_destroyed = true
		destroy_counter = cycles
	else:
		global.add_message("Modul " + name +" wird bereits zerstört")
		pass
	global.set_station_stat("Geld", (int(buildprice / 5))) # returns the fitht of the module price back to the players bank account if the module gets destroyed
	queue_free()
	pass

func set_is_build(boolean):
	is_build = boolean
	pass

func get_build_time():
	return build_time

#### Submodule Functions ####

### Cycle Functions ###

func register_module():
	return global.add_module(self)

func on_cycle_change(modifications, cycle):
	if (is_build):
		global.add_message(cycle_logic(modifications, cycle))
		if (will_destroyed):
			destroy_counter -= 1
			if (destroy_counter <= 0):
				destroy_module(destroy_counter)
		pass
	# If the building process is still in work, the counter of the remaing decreases by one, if the counter fall to 0 the module is build
	else:
		remaining_build_time -= 1
		global.add_message("Modul "+ name + " ist in " + str(remaining_build_time) + " fertiggestellt.")
		if (remaining_build_time <= 0):
			set_is_build(true)
			update_sprite()
	return true
	
func manipulate_resources():
	print(module_resource_changes)
	for resource_key in module_resource_changes.keys():
		if (global.resources.has(resource_key)):
			var add_val = int(global.resources[resource_key].get_value()) + int(module_resource_changes[resource_key])
			global.resources[resource_key].set_value(add_val) # Add visual output
		else:
			global.add_message("Fehler:" + "Resource " + resource_key +" nicht vorhanden. Pruefe module.csv!")
		pass
	pass
	
func manipulate_station_stats():
	print(module_station_stats_changes)
	for station_stats_key in module_station_stats_changes.keys():
		if (global.station_stats.has(station_stats_key)):
			var new_station_stat = global.get_station_stat(station_stats_key) + module_station_stats_changes[station_stats_key]
			global.add_station_stat(new_station_stat)
		else:
			global.add_message("Fehler:" + "Resource " + station_stats_key +" nicht vorhanden. Pruefe module.csv!")
		pass
	pass

func cycle_logic(modifications, cycle):
	manipulate_resources()
	manipulate_station_stats()
	# Method there all the Module Magic happens, return a message
	return ""