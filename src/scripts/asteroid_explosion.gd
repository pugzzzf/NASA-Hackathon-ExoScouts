extends Node2D

@onready var bg = $AnimatedBackground

func _ready() -> void:
	bg.play("map")
