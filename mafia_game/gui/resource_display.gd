extends HBoxContainer

var resource_name = "Generic Resource"

func _ready():
	update()
	pass
	
func set_resource_name(name):
	resource_name = name

func get_resource_name():
	return resource_name

func update():
	var resource_count = global.get_resource(resource_name)
	if(resource_count == null):
		resource_count = 0
	var resource_in_use_count = calc_resource_in_use_count()
	var child_count = self.get_child_count()
	get_node("label").set_text(str(resource_in_use_count, "/", resource_count, " ", resource_name))
	
func calc_resource_in_use_count():
	var sum = 0
	var modules = global.get_modules()
	for i in range(modules.size()):
		var module = modules[i]
		var settings = module.get_module_settings()
		for key in settings:
			if(key == resource_name):
				sum += settings[key]
	return sum