extends CharacterBody2D

func _physics_process(delta):
	var direction = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
	velocity = direction * 250
	move_and_slide()
	if velocity.x > 0:
		$Sprite.flip_h = false
		$Sprite.play('walk')
	elif velocity.x < 0:
		$Sprite.flip_h = true
		$Sprite.play('walk')
	else:
		$Sprite.play('idle')
	
