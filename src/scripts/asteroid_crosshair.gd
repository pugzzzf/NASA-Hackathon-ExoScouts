extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # No need to modify this unless you want something specific on ready.

func _physics_process(_delta: float) -> void:
	follow_mouse()

func follow_mouse() -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	position = mouse_pos  # Use 'position' to set the Sprite2D's position
