extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$normal.show()
	$C.hide()
	$Db.hide()
	$D.hide()
	$Eb.hide()
	$E.hide()
	$F.hide()
	$Gb.hide()
	$G.hide()
	
func _process(delta):
	$C.hide()
	$Db.hide()
	$D.hide()
	$Eb.hide()
	$E.hide()
	$F.hide()
	$Gb.hide()
	$G.hide()
	if Input.is_action_pressed("one"):
		$C.show()
	if Input.is_action_pressed("two"):
		$Db.show()
	if Input.is_action_pressed("three"):
		$D.show()
	if Input.is_action_pressed("four"):
		$Eb.show()
	if Input.is_action_pressed("five"):
		$E.show()
	if Input.is_action_pressed("six"):
		$F.show()
	if Input.is_action_pressed("seven"):
		$Gb.show()
	if Input.is_action_pressed("eight"):
		$G.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
