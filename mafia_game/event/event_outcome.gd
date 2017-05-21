extends Node

var valuekey # Key of the value that is affected
var value # The Value that is affected
var valuetype = 0 # The valuetype, 0 is ressources, 1 is stationstats, 2 is modules (build), 3 is other kind of value
var operator = 0 # The kind of operator that will be, 0 is add to value, 1 is substract to value, 2 divide value, 3 is multiplie value, 4 is replace value
## ToDo: Add a Var that determines the probability of that outcome


func _init(valuekey, value, valuetype, operator):
	## ToDo: check if init is the correct constructor
	self.valuekey = valuekey
	self.value = int(value)
	self.valuetype = int(valuetype)
	self.operator = int(operator)
	pass

func _ready():
	pass

func get_outcome_desc():
	# Generates of description of the kind of outcome
	##ToDo: Something something hardcoded output messages are ugly
	if (operator == 0):
		return ("Addiert " + str(value) + " zu " + str(valuekey))
	elif (operator == 1):
		return ("Zieht " + str(value) + " von " + str(valuekey) + " ab")
	elif (operator == 2):
		return ("Teilt " + str(valuekey) + " durch " + str(value))
	elif (operator == 3):
		return ("Multipliziert " + str(value) + " mit " + str(valuekey))
	elif (operator == 4):
		return ("Setzt "+ str(valuekey) + "zu " + str(value))
	return ("Unbekannte Wirkung")

func fullfill():
	if (valuetype == 0):
	# Valuetype 0 = a Ressource Type
		var allvalues = global.get_resources()
		if (allvalues.has(valuekey)):
			if (operator == 0):
				allvalues[valuekey] += value
			elif (operator == 1):
				allvalues[valuekey] -= value
			elif (operator == 2):
				allvalues[valuekey] /= value
			elif (operator == 3):
				allvalues[valuekey] *= value
			elif (operator == 4):
				allvalues[valuekey] = value
				
	elif (valuetype == 1):
	# Valuetype 1 = a Station Stat Type
		var allvalues = global.get_station_stats()
		if (allvalues.has(valuekey)):
			if (operator == 0):
				allvalues[valuekey] += value
			elif (operator == 1):
				allvalues[valuekey] -= value
			elif (operator == 2):
				allvalues[valuekey] /= value
			elif (operator == 3):
				allvalues[valuekey] *= value
			elif (operator == 4):
				allvalues[valuekey] = value
	elif (valuetype == 2):
		##ToDo: Add List of Modules into the singleton object
		pass
	elif (valuetype == 3):
		##ToDo: Add List of other values into the singleton object
		pass
	#global.add_message(message)
	pass
