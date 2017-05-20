extends HBoxContainer

var resource_name = "Generic Resource"

func _ready():
	update()
	pass

func update():
	var resource_count = global.get_resource(resource_name)
	if(resource_count == null):
		resource_count = 0
	# TODO calculate used resources
	get_node("label").set_text(str("0/", resource_count, " ", resource_name))