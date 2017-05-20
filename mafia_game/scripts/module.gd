extends Node



var id = 0
var name = "module" + str(id)
var modname = "generic module"
var desc = "generic description"
var submodules = []
var buildprice = 0
var buildmaterials = { none = "" }


func _init(name, id):
	self.name = name
	self.id = id
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func add_submodule():
	pass

func on_cycle_change(modifications, cycle):
	#Do stuff
	return true
