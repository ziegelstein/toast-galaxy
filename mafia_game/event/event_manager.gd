extends Node

var Events = [] # Array of all Events
var preparedEvents = [] # Array of all Events that are possible (which requierements are fulfilled) and which is weighted 

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