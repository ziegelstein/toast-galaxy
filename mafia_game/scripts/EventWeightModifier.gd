extends Node

# 

var requierement
var weightgain = 0

func _init(requierement, weightgain):
	## ToDo: check if init is the correct constructor
	self.requierement = requierement
	self.weightgain = weightgain
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func get_weight():
	if (requierement != null):
		if requierement.check():
			return weightgain
		else: return 1
	return weightgain