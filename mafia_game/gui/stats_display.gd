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
		if(get_child_count() != 0):
			var seperator = VSeparator.new()
			add_child(seperator)
		var label = Label.new()
		label.set_text(str(key, ": ", stats[key]))
		add_child(label)