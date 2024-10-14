extends Node2D

var notebookpages = [
	"res://assets/notebook/PAGE1.png",
	"res://assets/notebook/PAGE2.png",
	"res://assets/notebook/PAGE3.png"
]

@onready var notebookcover: Sprite2D = $nbcover
@onready var notebook: Sprite2D = $notebook
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var texture = load(notebookpages[0])
@onready var pageturn: AudioStreamPlayer2D = $notebook/pageturn
var index = 0
var max_pages = 0
var found = 0

func _ready() -> void:
	$notebook/leftarrow.hide()
	if Globals.all:
		$notebook/stickynote.hide()
	add_pages()
	notebook.texture = texture
	max_pages = (notebookpages.size() - 1)
	notebook.hide()
	anim.play('notebook show')
	await anim.animation_finished
	await get_tree().create_timer(0.5).timeout
	notebookcover.hide()
	pageturn.play()
	notebook.show()

func add_pages():
	for system in Globals.planets:
		if Globals.planets[system][1]:
			var pages_to_append = Globals.planets[system].slice(3, Globals.planets[system].size())
			notebookpages.append_array(pages_to_append)
			found += 1
			print(found)
		if found == 5:
			Globals.all = true

func next_page():
	index += 1
	texture = load(notebookpages[index])
	notebook.texture = texture
	pageturn.play()
	if index == max_pages:
		$notebook/rightarrow.hide()
	$notebook/leftarrow.show()

func last_page():
	index -= 1
	texture = load(notebookpages[index])
	notebook.texture = texture
	pageturn.play()
	if index == 0:
		$notebook/leftarrow.hide()
	$notebook/rightarrow.show()

func _on_leftarrow_pressed() -> void:
	last_page()

func _on_rightarrow_pressed() -> void:
	next_page()

func _on_close_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/backgrounds/spaceship.tscn")
