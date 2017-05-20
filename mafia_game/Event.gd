extends Node

var name = "Generic Event" # Name of the Event
var desc = "Generic description" # Text of the Event
var message = "Generic Message" # Message that will be post if the Event if fullfilled
var requierements = [] # Array of requierements (as Requierment Object) that must fullfilt to trigger this event
var weightmodifiers = [] # Array of Weight Modificators (as WeightModifier Object), that will modificate the probability of the Event
var outcomes = [] # Array of Outcomes (as Outcome Object) that the Event will trigger
var eventOptions = [] # Array of Options (as EventOption Object) if the player can choose some options
var isPossible = true # Bool if the Event is possible
var weight = 1 #The weight of the Event
var hasOptions = false #Bool that indicates if an Event have possible options
var hasOutcomes = false #Bool that indicates if an Event have any outcomes

func _init(name, desc, message, requierements, weightmodifiers, outcomes, eventOptions):
	self.name = name
	self.desc = desc
	self.message = message
	self.eventOptions = eventOptions
	self.requierements = requirements
	self.weightmodifiers = weightmodifiers
	self.outcomes = outcomes
	if (not eventOptions.empty()):
		hasOptions = true
	# Check if the requierements for the Event are fullfilled
	if (not requierements.empty()):
		for requierement in requierements:
			if(not requierement.check()):
				isPossible = false
				break
	# Modify the weight of the Event
	if (not weightmodifiers.empty()):
		for weightmodifier in weightmodifiers:
			# Adds the weight of every modifier
			weight = weight + weightmodifier.get_weight()
		# Create the average of all modifiers
		weight = weight / weightmodifiers.size()

	if (not outcomes.empty()):
		hasOutcomes = true
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func get_weight():
	return weight

func is_possible():
	# Returns bool that is true than all requierements are fulfilled
	return isPossible

func fullfill():
	# Generates the outcome of the Event
	##ToDo: Options müssen auch eingepflegt werden
	if (hasOutcomes):
		for outcome in outcomes:
			outcome.fullfill()
	global.add_message(message)
