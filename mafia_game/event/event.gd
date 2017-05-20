extends Node

# Constructor vars
var name = "Generic Event" # Name of the Event
var desc = "Generic description" # Text of the Event
var message = "Generic Message" # Message that will be post if the Event if fullfilled
var weight = 1 #The weight of the Event
#List of substuff
var requirements = [] # Array of requirements (as Requierment Object) that must fullfilt to trigger this event
var outcomes = [] # Array of Outcomes (as Outcome Object) that the Event will trigger
var eventOptions = [] # Array of Options (as EventOption Object) if the player can choose some options
# Internal vars
var isPossible = true # Bool if the Event is possible
var hasOptions = false #Bool that indicates if an Event have possible options
var hasOutcomes = false #Bool that indicates if an Event have any outcomes

func _init(name, desc, message, weight, requirements, outcomes, eventOptions):
	self.name = name
	self.desc = desc
	self.message = message
	self.weight = int(weight)
	self.eventOptions = eventOptions
	self.requirements = requirements
	#self.weightmodifiers = weightmodifiers
	self.outcomes = outcomes
	if (eventOptions != null && eventOptions.size()>0):
		hasOptions = true
	# Check if the requirements for the Event are fullfilled
	if (eventOptions != null && requirements.size()>0):
		for requirement in requirements:
			if(not requirement.check()):
				isPossible = false
				break
			else:
				weight = weight + requirement.get_weight()
		#weight = int(weight / requirements.size())
	# Modify the weight of the Event

	if (outcomes != null && outcomes.size()>0):
		hasOutcomes = true
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func get_weight():
	return weight

func is_possible():
	# Returns bool that is true than all s are fulfilled
	if(!requirements.empty()):
		for req in requirements:
			if(!req.check()):
				return false
	return true

func fullfill():
	# Generates the outcome of the Event
	##ToDo: Options müssen auch eingepflegt werden
	####### Gewählte Option enthält outcome_no, die array-position vom outcome entspricht
	if (hasOutcomes):
		for outcome in outcomes:
			outcome.fullfill()
	global.add_message(message)

func to_string():
	var result = "Name:"+name+"\n"
	result += "Desc:"+desc+"\n"
	result += "Message:"+message+"\n"
	result += "Weight:"+str(weight)+"\n"
	result += "Requirements:\n"
	var i = 0
	for req in requirements:
		result += str(i)+":\n"
		result += "Value:"+str(req["value"])+"\n"
		i += 1
	result += "Outcomes:\n"
	i=0
	for out in outcomes:
		result += str(i)+":\n"
		result += "Value:"+str(out["value"])+"\n"
		i += 1
	result += "Options:\n"
	i=0
	for opt in eventOptions:
		result += str(i)+":\n"
		result += "Value:"+opt["message"]+"\n"
		i += 1
	return result
	