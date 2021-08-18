extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialogue = [
#<<<<<<< HEAD
#=======
		". . . WHERE AM I?",
		"A FOREST . . . I REMEMBER THIS PLACE . . .",
		"''THE RIVER THE FOREST THE HANGMAN'S NOOSE''",
		"''RETURN TO WHERE YOU SPREAD YOUR ROOTS . . .''",
		"WHAT A STRANGE DREAM THIS IS . . ."
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_completed(object, key):
	pass # Replace with function body.
