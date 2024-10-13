extends Node2D

@onready var marker: Area2D = $marker
@onready var target_zone: Area2D = $targetzone
@onready var count_label: Label = $counterlabel
@onready var on_target = false
@onready var anim = $anim
@onready var write: Sprite2D = $write
@onready var textbox: Label = $monkeyassist/textbox/MarginContainer/Label
var rng= RandomNumberGenerator.new()
var discovered = false
var is_moving = false
var speed = 450
var successful_attempts = 0 
var max_attempts = 5
var success_lines = [
	"Nice!",
	"I'll write that one \ndown in my notebook!",
	"Great Job!"
]
var miss_lines = [
	"Try getting it when the \nshadow is in the center!",
	"Nice try...",
	"You'll get it next time!"
]

func _ready():
	write.hide()
	target_zone.area_entered.connect(enter_area)
	target_zone.area_exited.connect(exit_area)
	update_success_count_label()
	anim.play("start")
	await anim.animation_finished
	reset_marker()
	successful_attempts = 0 
	is_moving = true

func enter_area(body):
	on_target = true

func exit_area(body):
	on_target = false

func _input(ui_select):
	if not discovered && not anim.is_playing():
		if Input.is_action_just_pressed('ui_select'):
			stop_marker()

func _physics_process(delta):
	if is_moving:
		move_marker(delta)

func move_marker(delta):
	marker.position.x += speed * delta
	if marker.position.x > get_viewport().size.x:
		marker.position.x = 0 

func stop_marker():
	is_moving = false 
	if on_target:
		successful_attempts += 1 
		print("Success", successful_attempts)
		update_success_count_label()
		textbox.text = success_lines[rng.randi_range(0, 2)]
		write.show()
		marker.position.x = 0
		anim.play("write")
		await anim.animation_finished
		if successful_attempts >= max_attempts:
			print("Challenge Complete")
			end_challenge()
		else:
			reset_marker()
	else:
		textbox.text = miss_lines[rng.randi_range(0, 2)]
		print("Missed")
		reset_marker()

func reset_marker():
	marker.position.x = 0
	is_moving = true

func end_challenge():
	anim.play("end")
	textbox.text = "Nice job finding every planet!"
	count_label.text = "You have completed this system!"
	reset_marker()

func update_success_count_label():
	var attempts_left = max_attempts - successful_attempts
	if attempts_left > 1:
		count_label.text = str(attempts_left) + " planets left"
	elif attempts_left == 1:
		count_label.text = str(attempts_left) + " planet left"
