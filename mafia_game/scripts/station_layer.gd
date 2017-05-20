extends Node

## Enums of the pos ##
# Need to be set, go ahead until line 124
enum pos0{POS, VERTEX, ROTATION}
const POS = 0
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos1{POS, VERTEX, ROTATION}
const POS = 1
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos2{POS, VERTEX, ROTATION}
const POS = 2
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos3{POS, VERTEX, ROTATION}
const POS = 3
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos4{POS, VERTEX, ROTATION}
const POS = 4
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos5{POS, VERTEX, ROTATION}
const POS = 5
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos6{POS, VERTEX, ROTATION}
const POS = 6
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos7{POS, VERTEX, ROTATION}
const POS = 7
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos8{POS, VERTEX, ROTATION}
const POS = 8
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos9{POS, VERTEX, ROTATION}
const POS = 9
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos10{POS, VERTEX, ROTATION}
const POS = 10
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos11{POS, VERTEX, ROTATION}
const POS = 11
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos12{POS, VERTEX, ROTATION}
const POS = 12
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos13{POS, VERTEX, ROTATION}
const POS = 13
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos14{POS, VERTEX, ROTATION}
const POS = 14
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos15{POS, VERTEX, ROTATION}
const POS = 15
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos16{POS, VERTEX, ROTATION}
const POS = 16
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos17{POS, VERTEX, ROTATION}
const POS = 17
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos18{POS, VERTEX, ROTATION}
const POS = 18
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos19{POS, VERTEX, ROTATION}
const POS = 19
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos20{POS, VERTEX, ROTATION}
const POS = 20
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos21{POS, VERTEX, ROTATION}
const POS = 21
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos22{POS, VERTEX, ROTATION}
const POS = 22
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

enum pos23{POS, VERTEX, ROTATION}
const POS = 23
const VERTEX = Vector2(0,0)
const ROTATION = 0 # Rotation

var laver = 0
var positions = [] #max Postions = 24 (3x2x4)
var modul_positions = []
var mySprite

func _init(layer):
	self.layer = layer
	positions = [[false, pos0],[false, pos1],[false, pos2],[false, pos3],[false, pos4],[false, pos5],[false, pos6],[false, pos7],[false, pos8],[false, pos9],[false, pos10],[false, pos11],[false, pos12],[false, pos13],[false, pos14],[false, pos15],[false, pos16],[false, pos17],[false, pos18],[false, pos19],[false, pos20],[false, pos21],[false, pos22],[false, pos23]]
	pass

func _ready(layer):
	mySprite = get_node("station_sprite")
	mySprite.
	pass
	
func add_module(module):
	for position in positions:
		if position[0] == false:
			var pos_enum = position[1]
			if (modul_positions.empty()):
				modul_positions[0] = [module, pos_enum["POS"]]
			else:
				modul_positions[modul_positions.size()] = [module, pos_enum["POS"]]
			position[0] = true
			global.add_message("Habe " + module.get_name() + "auf Layer " + str(pos) + " und Position " + str(pos_enum["POS"])+ " hinzugefügt")
			return true
	global.add_message("Fehler: Der Stationslayer " + str(layer) + " ist bereits voll!")
	return false

func get_module_pos(module):
	for module_position in modul_positions:
		if (module_position[1] == module):
			return module_position[0]
	return -1

func set_sprite(sprite_path, position):
	mySprite.set_texture(imageTexture.load(sprite_path))
	mySprite.set_pos(position)
	pass
	
func get_sprite():
	return mySprite
	
func get_layer():
	return layer