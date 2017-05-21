extends VBoxContainer

var module
var resource_name

func _ready():
	pass

func set_module(module):
	self.module = module
	
func set_resource(resource_name):
	self.resource_name = resource_name

func update():
	get_node("label").set(resource_name)
	var maximum = global.get_resource(resource_name).get_value()-(global.calc_resource_in_use_count(resource_name)-module.get_module_settings[resource_name])
	get_node("spinbox").set_max(maximum)
	
	get_node("spinbox").set_value(module.get_module_settings[resource_name])

func _on_spinbox_value_changed( value ):
	var settings = module.get_resource_settings()
	settings[resource_name] = value
	module.set_resource_settings(settings)
	global.update_resource_display()
