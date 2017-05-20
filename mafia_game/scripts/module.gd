extends Node

var name = "generic module"
var desc = "generic description"
var id = 0
var moduleid = 0 #
var submodules = []
var buildprice = 0
var buildmaterials = { none = "" }


func _init(name, desc, id):
	self.name = name
	self.desc = desc
	self.id = id
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
