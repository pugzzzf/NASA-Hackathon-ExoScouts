extends StaticBody2D

@onready var albert: AnimatedSprite2D = $albert

const lines: Array[String] = [
	"Press 'Space' when you see a shadow in the middle!",
	"Nice!",
	"I'll write that one down in my notebook!",
	"Great Job!",
	"Try getting it when the shadow is in the middle of the star!",
	"Nice try...",
	"You'll get it next time!"
]

func _ready() -> void:
	albert.play('idle')
