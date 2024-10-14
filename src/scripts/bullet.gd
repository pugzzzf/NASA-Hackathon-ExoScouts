extends Node2D

var speed: float = 200.0
var direction: Vector2 = Vector2.ZERO
var shooter: Node2D
var disappearing = false
var clicked: bool = false

func _ready() -> void:
	$AnimatedSprite2D.animation_finished.connect(_on_animation_finished)
	rotation_degrees = randf_range(-180, 180)
	var random_scale = randf_range(0.75, 1.25)  
	scale = Vector2(random_scale, random_scale)

	var viewport_size = get_viewport().get_size()
	var target_position = Vector2(randf() * viewport_size.x, randf() * viewport_size.y)
	direction = (target_position - position).normalized()

func _physics_process(delta: float) -> void:
	if disappearing:
		return
	position += direction * speed * delta
	if not get_viewport_rect().has_point(position):
		start_disappearance()
	
func _input(event):
	if clicked:
		return
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if get_global_mouse_position().distance_to(position) < 32: 
			print("Hit Bullet")
			clicked = true
			start_disappearance()
			if shooter:
				shooter.on_bullet_clicked()

func start_disappearance() -> void:
	disappearing = true 
	$AnimatedSprite2D.play("disappear")
	
func _on_animation_finished() -> void:
	queue_free()

func is_offscreen() -> bool:
	var viewport_rect = get_viewport().get_visible_rect()
	return !viewport_rect.has_point(position)
