extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var name
var value
var additional_properties

func _init(name, value):
	self.name = name
	self.value = value
	self.additional_properties = {}

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func set_value(val):
	value = val
	
func get_value():
	return value

func add_property(key, value):
	additional_properties[key] = value
	

func get_property(key):
	if(additional_properties.has_key(key)):
		return additional_properties[key]
	return null