extends Node

# An Event Requierment
# Must be fullfilled if an Event can be triggerd

var valuekey # Key of the value that is needed to be fullfilled
var value # The Value that needs to be fullfilled
var valuetype = 0 # The valuetype, 0 is ressources, 1 is stationstats, 2 is modules (build), 3 is other kind of value
var operator = 0 # The kind of operator that needs to be fullfilled, 0 is greater than value, 1 is smaller than value, 2 is equals value
var weight = 0


func _init(valuekey, value, valuetype, operator, weight):
	## ToDo: check if init is the correct constructor
	self.valuekey = valuekey
	self.value = value
	self.valuetype = valuetype
	self.operator = operator
	self.weight = weight
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func get_weight():
	return weight

func check():
	# Checks if the requierment is fullfilled.
	# First check what kind of value should be checked, then checks if the valuekey is existing, after that is chooses the kind of operation and
	# checkes if the operations is true
	if (valuetype == 0):
		# Valuetype 0 = a ressource value
		var allvalues = global.get_ressources()
		if (allvalues.has(valuekey)):
			if (operator == 0):
				return (value >= allvalues[valuekey])
			elif (operator == 1):
				return (value <= allvalues[valuekey])
			elif (operator == 2):
				return (value == allvalues[valuekey])
				
	elif (valuetype == 1):
		# Valuetype 1 = a station stat
		var allvalues = global.get_station_stats()
		if (allvalues.has(valuekey)):
			if (operator == 0):
				return (value >= allvalues[valuekey])
			elif (operator == 1):
				return (value <= allvalues[valuekey])
			elif (operator == 2):
				return (value == allvalues[valuekey])
				
	elif (valuetype == 2):
		## ToDo: Add a List of all build modules into the singleton object
		return false
	elif (valuetype == 3):
		## ToDo: Add a List of other checkable Values into the singleton object
		return false
	return false