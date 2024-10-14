extends Node2D

var bullet_scene: PackedScene
var bullets_hit_count = 0  
var max_bullets = 10  
var spawn_timer: float = 0.35
var spawn_timer_accumulator: float = 0.0
var asteroids_label: Label = null
var bullets: Array = []
var rng = RandomNumberGenerator.new()
@onready var textbox: Label = $monkeyassist/textbox/MarginContainer/Label
const success_lines = [
	"Nice shot!",
	"Good shooting!",
	"Great job!"
]

func _ready() -> void:
	bullet_scene = preload("res://scenes/Bullet.tscn")
	asteroids_label = get_node_or_null("AsteroidsLabel")
	textbox.text = "Clear the way by clicking on an asteroid!!!"
	
	if asteroids_label == null:
		print("AsteroidsLabel not found!")
	else:
		update_asteroids_label()

func _physics_process(delta: float) -> void:
	spawn_timer_accumulator += delta
	if spawn_timer_accumulator >= spawn_timer and bullets_hit_count < max_bullets:
		spawn_bullet()
		spawn_timer_accumulator = 0.0  

func spawn_bullet():
	var screen_center: Vector2 = get_viewport().get_size() / 2.0  
	var spawn_position: Vector2
	var edge_choice = randi() % 4

	match edge_choice:
		0: spawn_position = Vector2(randf() * get_viewport().get_size().x, 0)  
		1: spawn_position = Vector2(get_viewport().get_size().x, randf() * get_viewport().get_size().y)
		2: spawn_position = Vector2(randf() * get_viewport().get_size().x, get_viewport().get_size().y)
		3: spawn_position = Vector2(0, randf() * get_viewport().get_size().y) 

	var bullet_instance = bullet_scene.instantiate()
	bullet_instance.position = spawn_position
	bullet_instance.direction = (screen_center - spawn_position).normalized()  
	bullet_instance.speed = 200
	bullet_instance.shooter = self

	var bg = get_node("bg")
	if bg:
		bg.add_child(bullet_instance)
		bullets.append(bullet_instance)
	else:
		print("bg node not found!")

func on_bullet_clicked():
	textbox.text = success_lines[rng.randi_range(0, 2)]
	bullets_hit_count += 1
	update_asteroids_label()

	if bullets_hit_count >= max_bullets:
		print("Maximum bullets hit reached")
		get_tree().change_scene_to_file("res://scenes/backgrounds/stars.tscn")

func update_asteroids_label() -> void:
	if asteroids_label != null:
		var remaining_asteroids = max_bullets - bullets_hit_count
		asteroids_label.text = str(remaining_asteroids) + " Asteroids left"
