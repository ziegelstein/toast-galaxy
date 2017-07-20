extends Node

var name = "" # Name of the option
var desc = "" # Description of the option
var message = "" # Message that will be displayed if this option is choosen
var outcome_no

func _init(name, desc, message, outcome_no):
	##ToDo: Check if this is the correct constructor
	self.name = name
	self.desc = desc
	self.message = message
	self.outcome_no = int(outcome_no)
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func get_desc():
	return desc

func get_name():
	return name

#func get_effects():
#	# Get a list of all effects, return them in an array of strings
#	var effects = []
#	if (outcomes.empty()):
#		return "Keinen Effekt"
#	for outcome in outcomes:
#		effects.append(outcome.get_outcome_desc())
#	return effects

func choose_option():
	pass
	# Fullfill all outcomes and poste the outcome message into the singleton object
#	if (not is_possible):
#		pass
#	if (outcomes.empty()):
#		global.add_message(message)
#		pass
#	for outcome in outcomes:
#		outcome.fullfill()
#	global.add_message(message)
#	pass

func is_possible():
	# Checks if all requierements are met, return bool
	pass
#for requierement in requierements:
#		if (requierement.check() == false):
#			return false
#	return true
