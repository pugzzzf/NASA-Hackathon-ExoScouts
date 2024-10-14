extends StaticBody2D

@onready var available: Label = $availablelabel
@onready var move: AnimationPlayer = $planetmove

func _ready() -> void:
	available.hide()
	$planetmove.play('idle')


func _on_kepler_16_pressed():
	get_tree().change_scene_to_file("res://scenes/asteroid_minigame.tscn")
	Globals.choice = "Kepler-16"

func _on_copernicus_pressed():
	available.show()

func _on_pegasi_pressed():
	available.show()

func _on_kepler_186e_pressed():
	get_tree().change_scene_to_file("res://scenes/asteroid_minigame.tscn")
	Globals.choice = "Kepler-186e"

func _on_gj_pressed():
	get_tree().change_scene_to_file("res://scenes/asteroid_minigame.tscn")
	Globals.choice = "GJ-1132"
