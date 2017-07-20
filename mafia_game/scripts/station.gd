extends Node

var station_layers = []
var station_layer_scene = preload("res://scenes/station_layer.tscn")

func _init():
	if station_layers.empty():
		station_layers.append(new_station_layer())
	pass

func initial_layer():
	if station_layers.empty():
		station_layers.append(new_station_layer())
	pass

func new_station_layer():
	var station_layer = station_layer_scene.instance()
	add_child(station_layer)
	station_layer.set_layer(station_layers.size())
	station_layers.append(station_layer)
	pass

func get_number_of_layers():
	return station_layers.size()

func get_current_layer():
	return station_layers[global.get_station_stat("GeladenerLayer")]

func get_layer(layernum):
	return station_layers[layernum]
	
func change_layer(layernum):
	global.set_station_stat("GeladenerLayer", layernum)
	for station_layer in station_layers:
		station_layer.update_sprite()