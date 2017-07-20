extends VBoxContainer

var resource_display_class = preload("res://gui/resource_display.tscn")

func _ready():
	var resources = global.get_resources()
	for key in resources:
		var display = resource_display_class.instance()
		display.set_resource_name(key)
		add_child(display)
		display.update()

func update():
	for i in range(get_child_count()):
		get_children()[i].update()