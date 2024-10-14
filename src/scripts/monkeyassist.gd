extends StaticBody2D

@onready var albert: AnimatedSprite2D = $albert

func _ready() -> void:
	albert.play('idle')
