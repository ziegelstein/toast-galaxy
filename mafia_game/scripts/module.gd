extends Node



var id = 0
var name = "generic name"
var modname = "generic module"
var desc = "generic description"
var spritepath = ""
var submodules = [] # Array of Submodue
var buildprice = 0
var buildmaterials = [] #An Array of Arrays style [[str,int]] ->[["key",value], ["maschinen", 5], ["Waffen", 3]] 


func _init(modname, id):
	self.modname = modname
	self.id = id
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	name = modname + str(id)

func add_submodule():
	pass

func on_cycle_change(modifications, cycle):
	#Do stuff
	return true

func is_build_possible():
	# Checks if all requierements for the module to build are met
	if (global.get_station_stat("Geld") >= buildprice):
		for buildmaterial in buildmaterials:
			if (global.get_resources(buildmaterial[0]) < buildmaterial):
				return false
				##ToDo Add requierement for research
		return true
	return false

func on_build():
	#build the module
	if (is_build_possible()):
		global.get_station_stat("Geld") = global.get_station_stat("Geld") - buildprice
	## ToDo Add logic
	return false