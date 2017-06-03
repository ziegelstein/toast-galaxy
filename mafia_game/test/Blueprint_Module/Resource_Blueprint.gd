extends Node

# VARIABLES #
## GLOBAL VARS ##
var name = "Generic Resource" # The Name of this resource, is useable as a key, always a String
var desc = "" # The description of the Resource
var parent = null # The Parent Resource, the resource will return itself if it has no parent resource
var childs = [] # An Array of Resource Objects that represents the children of the Resource, the Resource "alcohol" could have the childs "beer", "moonshine" and "wine" for example
var value_type = "none" # A String which variable type the value has, is either "bool", "int", "float", "string" or "null"
var icon_sprite_path = "" # The Path to the 
var value # The Value of the resource, can be an bool, an int, a float, or a string #! We could consider if an resource can be an object aswell
## ALLOCATABLE VARS ##
#! We could relocate the ALLOCATABLE VARS into a own script
var is_allocatable = false
var allocate_resource
## MODIFICATION VALUES ##
var value_modificator = 0

# FUNCTIONS #
func _ready(name, desc, icon_sprite_path, value):
	this.name = name
	this.desc = desc
	this.parent = parent
	this.icon_sprite_path = icon_sprite_path
	this.value = value
	pass
	
func set_resource_allocated(allocated_name, allocated_icon_sprite_path, allocated_value):
	
	pass

## SETTER AND GETTER ##

func get_name():
	return name
	
func get_desc():
	return desc
	
func get_parent():
	if (parent != null):
		return parent
	return this
	
func get_childs():
	return childs
	
func get_value_type():
	return value_type

func get_icon_sprite_path():
	return icon_sprite_path
	
func get_value():
	return value
	
func get_sum_value():
	# This functions returns the summed value of this resource and all of its childs
	var sum_value = value
	for child in childs:
		if has_same_value_type(child):
			sum_value += child.get_sum_value()
	return sum_value

func set_value_type(value):
	# This function uses the build-in typeof function to determine what kind of value is hold.
	# For more information read https://godot.readthedocs.io/en/stable/classes/class_@gdscript.html?highlight=typeof#class-gdscript-typeof
	var type_indicator = typeof(value)
	if type_indicator == 1: return "bool"
	elif type_indicator == 2: return "int"
	elif type_indicator == 3: return "float"
	elif type_indicator == 4: return "String"
	return "null"
	
func set_allocate_resource(resource):
	self.allocate_resource = resource
	pass

## CHECK FUNCTIONS

func has_parent():
	return (parent != null)

func has_childs():
	return (childs.size() != 0)
	
func has_same_value_type(child):
	# This function checks if the value_type of the child of this resource is the same as of this resource.
	if (value_type != child.get_value_type()):
		return false
	return true