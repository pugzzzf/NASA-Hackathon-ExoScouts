extends Node2D

var marker: Sprite2D 
var target_zone: Area2D 
var is_moving = false
var speed = 200 
var successful_attempts = 0 
var max_attempts = 5
var success_count_label: Label 

func _ready():
	marker = $planetmarker 
	target_zone = $targetzone 
	success_count_label = $counterlabel
	reset_marker()
	successful_attempts = 0 
	is_moving = true
	update_success_count_label()

func _process(delta):
	if is_moving:
		move_marker(delta)
	
	if Input.is_action_just_pressed("ui_select"):
		stop_marker()

func move_marker(delta):
	marker.position.x += speed * delta
	if marker.position.x > get_viewport().size.x:
		marker.position.x = 0 

func _on_marker_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			stop_marker()

func stop_marker():
	is_moving = false 
	if target_zone.get_overlapping_bodies().has(marker):
		successful_attempts += 1 
		print("Success! Stopped in the target zone! Total Successes: ", successful_attempts)
		update_success_count_label()
		if successful_attempts >= max_attempts:
			print("You've succeeded enough times! Challenge Complete!")
			reset_challenge()
		else:
			reset_marker()
	else:
		print("Missed! Try again.")
		reset_marker()

func reset_marker():
	marker.position.x = 0
	is_moving = true

func reset_challenge():
	successful_attempts = 0
	reset_marker()
	update_success_count_label()

func update_success_count_label():
	var attempts_left = max_attempts - successful_attempts
	success_count_label.text = str(attempts_left) + " planets left"
