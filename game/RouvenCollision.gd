extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _on_body_enter( body ):
	if (body extends preload("res://character_physics.gd")):
		get_tree().change_scene("res://menu.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
