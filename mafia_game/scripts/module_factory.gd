extends Node
var module_scene = preload("res://scenes/module.tscn")


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func build_module(blueprint_id):
	var blueprint = global.global_blueprint_reader.get_blueprint_by_id(blueprint_id)
	var station_layer = global.global_station.get_current_layer()
	var module = module_scene.instance()
	add_child(module)
	module.on_create(global.modules.size(), blueprint.modname, blueprint.desc)
	var pos_enum = station_layer.add_station_module(module)
	if (blueprint.has_resources):
		for blueprint_key in blueprint.resources.keys():
			module.add_resource_change(blueprint_key, blueprint.resources[blueprint_key])
	if (blueprint.has_station_stats):
		for blueprint_key in blueprint.station_stats.keys():
			module.add_resource_change(blueprint_key, blueprint.station_stats[blueprint_key])
	module.on_build(blueprint.spritepath, station_layer.get_module_pos(module), pos_enum["VECTOR"], pos_enum["ROTATION"])
	return module
