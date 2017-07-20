extends Node

## Enums of the pos ##
# Need to be set, go ahead until line 124
var pos0 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos1 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos2 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 }# Rotation in Degree

var pos3 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos4 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos5= {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos6 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos7 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos8 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos9 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos10 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos11 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos12 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos13 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos14 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos15 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos16 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos17 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos18 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos19 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 }# Rotation in Degree

var pos20 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos21 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos22 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var pos23 = {POS = 0, VECTOR = Vector2(0,0), ROTATION = 0 } # Rotation in Degree

var layer = 0 # Layer will be changed on the creation of the station layer
var positions = [] #max Postions = 24 (3x2x4) [bool if taken, pos_enum]
var modul_positions = [] # Contains [Int Position, Module]
var mySprite

enum station_enum{SPRITEPATH, VECTOR, ROTATION}
const SPRITEPATH = ""
const VECTOR = Vector2(0,0)
const ROTATION = 0

func _init():
	positions = [[false, pos0],[false, pos1],[false, pos2],[false, pos3],[false, pos4],[false, pos5],[false, pos6],[false, pos7],[false, pos8],[false, pos9],[false, pos10],[false, pos11],[false, pos12],[false, pos13],[false, pos14],[false, pos15],[false, pos16],[false, pos17],[false, pos18],[false, pos19],[false, pos20],[false, pos21],[false, pos22],[false, pos23]]
	pass

func _ready():
	mySprite = get_node("station_sprite")
	set_sprite(station_enum["SPRITEPATH"], station_enum["VECTOR"])
	update_sprite()
	pass
	
func set_layer(layer):
	self.layer = layer
	pass

func add_station_module(module):
	#Adds a Module into the station layer and returns the pos Data of that module
	for position in positions:
		if position[0] == false:
			var pos_enum = position[1]
			if (modul_positions.empty()):
				modul_positions.append([pos_enum["POS"], module])
			else:
				modul_positions[modul_positions.size()] = [pos_enum["POS"], module]
			position[0] = true
			global.add_message("Habe " + module.get_name() + "auf Layer " + str(layer) + " und Position " + str(pos_enum["POS"])+ " hinzugefügt")
			return pos_enum
	global.add_message("Fehler: Der Stationslayer " + str(layer) + " ist bereits voll!")
	return []

func update_sprite():
	# Checks if the station_layer should be visible now
	if (global.get_station_stat("GeladenerLayer") == layer):
		mySprite.show()
	else:
		mySprite.hide()
		# Hide all modules of that layer
		for module_position in modul_positions:
			module_position[1].hide_module()
	pass

func get_module_pos(module):
	# Returns the postion of the module in the layer
	for module_position in modul_positions:
		if (module_position[1] == module):
			return module_position[0]
	return -1

func get_module_args(module):
	## Returns the position data of a module in the station layer
	for module_position in modul_positions:
		if (module_position[1] == module):
			# Returns the enum on the position the module have
			return positions[module_position[0]][1]
	return []

func set_sprite(sprite_path, position):
	# set the sprite of the station layer
	var imageTexture = ImageTexture.new()
	mySprite.set_texture(imageTexture.load(sprite_path))
	mySprite.set_pos(position)
	pass
	
func get_sprite():
	return mySprite
	
func get_layer():
	return layer