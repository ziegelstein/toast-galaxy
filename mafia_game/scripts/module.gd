extends Node

var id = 0
var name = "generic name"
var modname = "generic module"
var desc = "generic description"
var spritepath = "res://assets/freierBauplatz.png"
var submodules = [] # Array of Submodue
#Building Variable
var buildprice = 0
var buildmaterials = [] #An Array of Arrays style [[str,int]] ->[["key",value], ["maschinen", 5], ["Waffen", 3]]
var is_build = false

# Position vars
var position = 0 # Position of the module on the space station
# Sprite Vars
var is_visible = false
var pos_vector = Vector2(0,0)
var rotation = deg2rad(0) # The rotation in degree
var mySprite


func _init(modname, id):
	self.modname = modname
	self.id = id
	pass

func _ready():
	mySprite = get_node("moduleSprite")
	name = modname + str(id)
	var imageTexture = ImageTexture.new()
	mySprite.set_texture(imageTexture.load(spritepath))
	mySprite.set_pos(pos_vector)
	mySprite.set_rot(rotation)

func add_submodule():
	pass

func on_cycle_change(modifications, cycle):
	#Do stuff
	return true

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
		is_build = true
		return true
	return false