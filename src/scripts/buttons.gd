extends StaticBody2D

func _on_notebook_pressed():
	get_tree().change_scene_to_file("res://scenes/notebook.tscn")

func _on_home_pressed():
	get_tree().change_scene_to_file("res://scenes/backgrounds/spaceship.tscn")
