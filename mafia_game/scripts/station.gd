extends Node

var station_layers = []
var station_layer_scene = preload("res://scenes/station_layer.tscn")

func _init():
	station_layers.append(station_layer_scene.instance(0))
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func new_station_layer():
	station_layers.append(station_layer_scene.instance(station_layer_scene.size()))
	pass

func get_number_of_layers():
	return station_layers.size()
	
func get_layer(layernum):
	return station_layers[layernum]