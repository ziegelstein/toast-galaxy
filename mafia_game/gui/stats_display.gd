extends HBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	update()
	pass

func update():
	global.clear_children(self.get_node("."))
	var stats = global.get_station_stats()
	for key in stats:
		create_and_append_label(str(key, ": ", stats[key]))
	create_and_append_label(str("Tag: ", global.get_cycles_of_metacycle()))
	
func create_and_append_label(text):
	if(get_child_count() != 0):
		var seperator = VSeparator.new()
		add_child(seperator)
	var label = Label.new()
	label.set_text(text)
	add_child(label)