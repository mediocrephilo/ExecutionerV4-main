extends KinematicBody2D

const ACCEL = 100
const MAXSPEED = 550
const UP = Vector2(0, -1)
var motion = Vector2()
var continuesprite = 0
var finished = false

func _ready():
	ForestSound.playsound()
	
func _physics_process(_delta):
	
	motion.y += 50
	motion.x = 0
	$playerSprite.play("idle")

func _on_dialoguebox_tree_exited():
	get_tree().change_scene("res://Act1/playerscenes/scene1/SceneOne.tscn")

