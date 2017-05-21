extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_scroll_follow(true)

func update():
	clear()
	var messages = global.get_messages()
	for i in range(messages.size()):
		add_text(messages[i] + "\n")