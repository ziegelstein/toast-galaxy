extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var label
onready var game = get_node("/root/global")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	label = get_node("debug")
	game.get_station_stats()["Angriff"] = 5
	label.set_text(game.get_station_stats().to_json())
