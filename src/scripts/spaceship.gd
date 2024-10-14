extends Node2D

@onready var bg: AnimatedSprite2D = $bg
@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	bg.play("ship")
	anim.play("idle")
