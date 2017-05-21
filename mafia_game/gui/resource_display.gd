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
	var resource_count = global.get_resource(resource_name).get_value()
	if(resource_count == null):
		resource_count = 0
	var resource_in_use_count = global.calc_resource_in_use_count(resource_name)
	if(resource_in_use_count == 0):
		get_node("label").set_text(str(resource_count, " ", resource_name))
	else:
		get_node("label").set_text(str(resource_count-resource_in_use_count, "/", resource_count, " ", resource_name))