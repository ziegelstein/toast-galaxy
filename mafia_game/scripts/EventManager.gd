extends Node

var Events = [] # Array of all Events
var preparedEvents = [] # Array of all Events that are possible (which requierements are fulfilled) and which is weighted 

func _ready():
	pass

func create_event_outcome():
	##ToDo
	pass
	
func create_event_requierement():
	##ToDo
	pass

func create_event_weight_modifier():
	##ToDo
	pass
	
func create_event_option():
	##ToDo
	pass

func create_event():
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