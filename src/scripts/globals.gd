extends Node2D

# Bool if all systems have been found
@onready var all = false
# Dictionary for planet values
# First value in array is planet count
# Second value is discovered boolean
# Third value is if majority planets were discovered by radial velocity or transit*
# Fourth value onward is texture file for notebook page(s)
# * Might not implent into minigame
@onready var planets = { 
	"Kepler-16": [1, false, 'Transit', 
	 "res://assets/notebook/KEPLER16BPAGE.png"], 
	"Copernicus": [5, true, 'Radial',
	 "res://assets/notebook/55CANCRIBPAGE.png",
	 "res://assets/notebook/55CANCRICPAGE.png",
	 "res://assets/notebook/55CANCRIDPAGE.png",
	 "res://assets/notebook/55CANCRIEPAGE.png",
	 "res://assets/notebook/55CANCRIFPAGE.png"], 
	"Pegasi": [1, true, 'Radial',
	 "res://assets/notebook/51PEGASIBPAGE.png"], 
	"Kepler-186e": [5, false, 'Transit',
	 "res://assets/notebook/KEPLER186BPAGE.png",
	 "res://assets/notebook/KEPLER186CPAGE.png",
	 "res://assets/notebook/KEPLER186DPAGE.png",
	 "res://assets/notebook/KEPLER186EPAGE.png",
	 "res://assets/notebook/KEPLER186FPAGE.png"], 
	"GJ-1132": [2, false, 'Transit', 
	 "res://assets/notebook/GJ1132BPAGE.png",
	 "res://assets/notebook/GJ1132CPAGE.png"],
}

@onready var choice = ''
