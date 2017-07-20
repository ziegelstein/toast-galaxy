extends VBoxContainer

var settings_entry_scene = preload("res://gui/module_settings_entry.tscn")

var module

func _ready():
	pass
	
func set_module(module):
	self.module = module
	
func update():
	get_node("module_name").set_text(module.get_name())
	
	get_node("module_description").set_text(module.get_desc())
	
	#Remove previous entries
	var settings_container = get_node("settings_entries")
	global.clear_children(settings_container)
	
	var settings = module.get_module_settings()
	for key in settings:
		var settings_entry = settings_entry_scene.instance()
		settings_entry.set_module(module)
		settings_entry.set_resource(key)
		get_node("settings_entries").add_child(settings_entry)