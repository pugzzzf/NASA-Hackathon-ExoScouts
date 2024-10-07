extends CharacterBody2D

func _ready():
	$AnimationPlayer.play('wlak')

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		print("Moving Right")
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		print("Moving Left")
	move_and_slide()
