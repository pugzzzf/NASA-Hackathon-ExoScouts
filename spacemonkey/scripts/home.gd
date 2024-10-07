extends TextureButton

func _pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/backgrounds/spaceship.tscn")
