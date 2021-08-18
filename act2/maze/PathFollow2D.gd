extends PathFollow2D


onready var foll = $PathFollow2D

func _ready():
	pass
	
func _process(delta):
	foll.set_offset(foll.get_offset() + 200 * delta)

