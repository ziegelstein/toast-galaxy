extends Node



var id = 0
var name
var modname = "generic module"
var desc = "generic description"
var submodules = []
var buildprice = 0
var buildmaterials = { none = "" }


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
