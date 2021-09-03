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
	if Input.is_action_just_pressed("one"):
		$C.show()
		$c.play()
		$db.stop()
		$d.stop()
		$eb.stop()
		$e.stop()
		$f.stop()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("two"):
		$Db.show()
		$c.stop()
		$db.play()
		$d.stop()
		$eb.stop()
		$e.stop()
		$f.stop()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("three"):
		$D.show()
		$c.stop()
		$db.stop()
		$d.play()
		$eb.stop()
		$e.stop()
		$f.stop()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("four"):
		$Eb.show()
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.play()
		$e.stop()
		$f.stop()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("five"):
		$E.show()
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.stop()
		$e.play()
		$f.stop()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("six"):
		$F.show()
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.stop()
		$e.stop()
		$f.play()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("seven"):
		$Gb.show()		
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.stop()
		$e.stop()
		$f.stop()
		$gb.play()
		$g.stop()
	if Input.is_action_just_pressed("eight"):
		$G.show()
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.stop()
		$e.stop()
		$f.stop()
		$gb.stop()
		$g.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
