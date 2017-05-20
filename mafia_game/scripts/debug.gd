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
	var file = File.new()
	file.open("res://data/events.json", file.READ)
	var events_dict = {}
	var json = file.get_as_text()
	events_dict.parse_json(json)
	var events = ""
	for ev in events_dict["events"]:
		events += ev["name"]
	label.set_text(events)