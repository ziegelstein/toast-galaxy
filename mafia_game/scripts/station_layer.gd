extends Node

## Enums of the pos ##
# Need to be set, go ahead until line 124
enum pos0{POS, VECTOR, ROTATION}
const POS = 0
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos1{POS, VECTOR, ROTATION}
const POS = 1
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos2{POS, VECTOR, ROTATION}
const POS = 2
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos3{POS, VECTOR, ROTATION}
const POS = 3
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos4{POS, VECTOR, ROTATION}
const POS = 4
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos5{POS, VECTOR, ROTATION}
const POS = 5
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos6{POS, VECTOR, ROTATION}
const POS = 6
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos7{POS, VECTOR, ROTATION}
const POS = 7
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos8{POS, VECTOR, ROTATION}
const POS = 8
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos9{POS, VECTOR, ROTATION}
const POS = 9
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos10{POS, VECTOR, ROTATION}
const POS = 10
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos11{POS, VECTOR, ROTATION}
const POS = 11
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos12{POS, VECTOR, ROTATION}
const POS = 12
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos13{POS, VECTOR, ROTATION}
const POS = 13
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos14{POS, VECTOR, ROTATION}
const POS = 14
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos15{POS, VECTOR, ROTATION}
const POS = 15
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos16{POS, VECTOR, ROTATION}
const POS = 16
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos17{POS, VECTOR, ROTATION}
const POS = 17
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos18{POS, VECTOR, ROTATION}
const POS = 18
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos19{POS, VECTOR, ROTATION}
const POS = 19
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos20{POS, VECTOR, ROTATION}
const POS = 20
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos21{POS, VECTOR, ROTATION}
const POS = 21
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos22{POS, VECTOR, ROTATION}
const POS = 22
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

enum pos23{POS, VECTOR, ROTATION}
const POS = 23
const VECTOR = Vector2(0,0)
const ROTATION = 0 # Rotation in Degree

var laver = 0 # Layer will be changed on the creation of the station layer
var positions = [] #max Postions = 24 (3x2x4)
var modul_positions = [] # Contains [Int Position, Module]
var mySprite

enum station_enum{SPRITEPATH, VECTOR, ROTATION}
const SPRITEPATH = ""
const VECTOR = Vector2(0,0)
const ROTATION = 0

func _init(layer):
	self.layer = layer
	positions = [[false, pos0],[false, pos1],[false, pos2],[false, pos3],[false, pos4],[false, pos5],[false, pos6],[false, pos7],[false, pos8],[false, pos9],[false, pos10],[false, pos11],[false, pos12],[false, pos13],[false, pos14],[false, pos15],[false, pos16],[false, pos17],[false, pos18],[false, pos19],[false, pos20],[false, pos21],[false, pos22],[false, pos23]]
	pass

func _ready():
	mySprite = get_node("station_sprite")
	set_sprite(station_enum["SPRITEPATH"], station_enum["VECTOR"])
	update_sprite()
	pass
	
func add_module(module):
	#Adds a Module into the station layer and returns the pos Data of that module
	for position in positions:
		if position[0] == false:
			var pos_enum = position[1]
			if (modul_positions.empty()):
				modul_positions[0] = [module, pos_enum["POS"]]
			else:
				modul_positions[modul_positions.size()] = [module, pos_enum["POS"]]
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
			module_postion[1].hide_module()
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
	mySprite.set_texture(imageTexture.load(sprite_path))
	mySprite.set_pos(position)
	pass
	
func get_sprite():
	return mySprite
	
func get_layer():
	return layer