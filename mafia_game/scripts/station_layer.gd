extends Node

var layer = 0
var positions = []
var mySprite

enum {}
const STUFF = 1


func _ready(layer):
	self.layer = layer
	mySprite = get_node("station_sprite")
	# Called every time the node is added to the scene.
	# Initialization here
	pass
