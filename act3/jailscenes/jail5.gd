extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	$dialoguebox2.hide()


func _on_dialoguebox_tree_exited():
	$dialoguebox2.show()
