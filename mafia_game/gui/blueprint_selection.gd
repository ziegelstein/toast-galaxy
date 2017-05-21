extends PopupMenu

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var blueprints = global.global_blueprint_reader.get_blueprints()
	for key in blueprints:
		add_item(blueprints[key].modname)

func _on_blueprint_selection_item_pressed( ID ):
	global.add_message(get_item_text(ID))
	pass # replace with function body
