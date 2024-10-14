extends Node2D

@onready var bg: AnimatedSprite2D = $bg

func _ready() -> void:
	bg.play("map")
