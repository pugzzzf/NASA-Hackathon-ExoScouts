extends Node2D

@onready var texture = ''
@onready var color = Color(0, 0, 0)
@onready var star: Sprite2D = $star

func _ready():
	match Globals.choice:
		"Kepler-16":
			texture = load("res://assets/stars/kepler16.png")
			color = Color(1.42, 1, 1)
			star.self_modulate = color
			star.position.x = 456
			star.position.y = 397
			star.texture = texture
		"Kepler-186e":
			texture = load("res://assets/stars/Kepler 186e.png")
			color = Color(1.42, 1, 1)
			star.self_modulate = color
			star.position.x = 584
			star.position.y = 335
			star.texture = texture
		"GJ-1132":
			texture = load("res://assets/stars/GJ 1132.png")
			color = Color(2.4, 2.2, 2.2)
			star.self_modulate = color
			star.position.x = 584
			star.position.y = 335
			star.texture = texture

func _input(_ui_select):
	if Input.is_action_just_pressed('ui_select'):
		get_tree().change_scene_to_file("res://scenes/backgrounds/minigame.tscn")
