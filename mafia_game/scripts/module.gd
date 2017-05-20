extends Node

#Basic vars
var id = 0
var name = "generic name"
var modname = "generic module"
var desc = "generic description"

# Meta vars
var submodules = [] # Array of Submodules
var module_informations = {}
var module_settings = {}

#Building Variable
var buildprice = 0 # Price in Uron
var buildmaterials = [] #An Array of Arrays style [[str,int]] ->[["key",value], ["maschinen", 5], ["Waffen", 3]]
var build_time = 1 #The amount of time that is needed to build that module
var remaining_build_time = build_time
var is_build = false

# Position vars
var position = 0 # Position of the module on the space station
# Sprite Vars
var spritepath = "res://assets/freierBauplatz.png"
var is_visible = false
var pos_vector = Vector2(0,0)
var rotation = deg2rad(0) # The rotation in degree
var mySprite

### Constructing Methods ###
func _init(modname, id):
	self.modname = modname
	self.id = id
	pass

func _ready():
	mySprite = get_node("moduleSprite")
	name = modname + str(id)
	set_graph()
	
func set_graph():
	var imageTexture = ImageTexture.new()
	mySprite.set_texture(imageTexture.load(spritepath))
	mySprite.set_pos(pos_vector)
	mySprite.set_rot(rotation)
	if (is_visible == false):
		mySprite.hide()
	else: mySprite.show()

func set_module_informations():
	pass

### GUI Methods ###
func get_module_values():
	set_module_values()
	pass

### General Getter and Setter ###

### Building Methods ###
func add_submodule():
	pass

func is_build_possible():
	# Checks if all requierements for the module to build are met
	if (global.get_station_stat("Geld") >= buildprice):
		for buildmaterial in buildmaterials:
			if (global.get_resource(buildmaterial[0]) < buildmaterial[1]):
				return false
				##ToDo Add requierement for research
		return true
	return false

func on_build(position, pos_vector, rotation):
	#build the module
	if (is_build_possible()):
		global.get_station_stat["Geld"] = global.get_station_stat["Geld"] - buildprice
		for buildmaterial in buildmaterials:
			var value = global.get_resource(buildmaterial[0]) - buildmaterial[1]
			global.set_resource(buildmaterial[0], value)
		self.position = position
		self.pos_vector = pos_vector
		self.rotation = rotation
		##ToDo Add a "In Construction" Sprite
		set_graph()
		global.add_message("Modul " + name + " wird gebaut.")
		return true
	return false
	
func set_is_build(boolean):
	is_build = boolean
	pass

func get_build_time():
	return build_time

### Cycle Functions ###

func register_modul():
	pass

func on_cycle_change(modifications, cycle):
	if (is_build):
		#Do Stuff
		pass
	# If the building process is still in work, the counter of the remaing decreases by one, if the counter fall to 0 the module is build
	else:
		remaining_build_time -= 1
		global.add_message("Modul "+ name + " ist in " + str(remaining_build_time) + " fertiggestellt.")
		if (remaining_build_time <= 0):
			set_is_build(true)
	return true