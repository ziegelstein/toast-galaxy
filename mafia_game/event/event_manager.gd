extends Node

var Events = [] # Array of all Events
var preparedEvents = [] # Array of all Events that are possible (which requierements are fulfilled) and which is weighted 

var event_class = preload("res://event/event.gd")
var event_requirement_class = preload("res://event/event_requierement.gd")
var event_option_class = preload("res://event/event_option.gd")
var event_outcome_class = preload("res://event/event_outcome.gd")

func _init():
	parse_event_file("res://data/events.json")

func _ready():
	pass

func create_event_outcome(valuekey, value, valuetype, operator, message):
	#vars: valuekey = str of the key, value = var of the value, valuetype = int of the type of the value, operator = int of operator, message = str of the message
	##ToDo
	pass
	
func create_event_requierement(valuekey, value, valuetype, operator):
	#vars: valuekey = str of the key, value = var of the value, valuetype = int of the type of the value, operator = int of the operator
	##ToDo
	pass

	
func create_event_option(name, desc, message, outcomes, requierements):
	#vars: outcomes = array of outcomes, requierements = array of requierements, name = string, desc = string, message = string
	##ToDo
	pass

func create_event(name, desc, message, requierements, outcomes, eventOptions):
	#vars: name = string, desc = string, message = string, requierements = array of requierement, outcomes = array of outcomes, eventOptions = array of eventOptions
	##ToDo
	pass

func prepare_events():
	# Prepare Events for random generation, first it filter all events which requierements are fulfilled, then it weight the list according to the requierement weight
	preparedEvents = calculate_weight(filter_events())
	pass

func filter_events():
	# Generates a Array of all Events that are possible (which Requierements are fullfilled)
	var possibleEvents = []
	for Event in Events:
		if Event.is_possible():
			possibleEvents.append(Event)
	return possibleEvents
	
func calculate_weight(eventarray):
	# Generates a Array that is weighted according to the weight of all Events
	var weightedEvents = []
	for Event in eventarray:
		for i in range(Event.getWeight()):
			weightedEvents.append(Event)
	return weightedEvents

func get_event():
	return Events

func get_erepared_event():
	#Return a prepared Event
	prepare_events()
	return Events[rand_range(1.0,Events.size())]

func parse_event_file(path):
	var file = File.new()
	file.open(path, file.READ)
	var events_dict = {}
	var json = file.get_as_text()
	events_dict.parse_json(json)
	var event
	for ev in events_dict["events"]:
		event = parse_event(ev)


# Nimmt Event-Daten und gibt daraus erstelltes Event-Objekt zurück
func parse_event(event_data):
	# TODO Outcomes und Options hinzufügen
	var new_event = event_class.new(event_data["name"], event_data["description"], event_data["message"], event_data["weight"], parse_requirements(event_data["requirements"]), parse_outcomes(event_data["outcomes"]), parse_options(event_data["options"]))
	Events.append(new_event)

func parse_requirements(requirements_data):
	var new_req
	var req_array = []
	for req in requirements_data:
		new_req = event_requirement_class.new(req["valuekey"], req["value"], req["valuetype"], req["operator"], req["weight"]) 
		req_array.append(new_req)
	return req_array


func parse_options(options_data):
	var new_option
	var option_array = []
	for opt in options_data:
		new_option = event_option_class.new(opt["name"], opt["description"], opt["message"], opt["outcome"])
		option_array.append(new_option)
	return option_array

func parse_outcomes(outcome_data):
	var new_outcome
	var outcome_array = []
	for out in outcome_data:
		new_outcome = event_outcome_class.new(out["valuekey"],out["value"],out["valuetype"],out["operator"])
		outcome_array.append(new_outcome)
	return outcome_array

