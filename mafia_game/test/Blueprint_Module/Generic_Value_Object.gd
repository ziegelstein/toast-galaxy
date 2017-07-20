extends Node
### DESCRIPTION OF THAT CLASS ###

### GLOBAL VARS ###
var values = {}; # Key-Value Store of all Values Stored in this object.

### FUNCTIONS ###

#### INIT / CONSTRUCTOR FUNCTIONS ####
func _init():#Need some Information for Creation
	pass

func _ready():
	# Is empty because Interface
	pass
	
#### GETTER AND SETTER ####

func get_values():
	return values;
	
func get_value(key):
	return values[key];
	
func set_value(key, value):
	if (values.has(key)):
		values[key]=value
	else:
		#Error Message
		print("Fuck You")
	pass