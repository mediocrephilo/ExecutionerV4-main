extends Node2D

var redselect = false
var blueselect = false
var greenselect = false
var yelselect = false

var canInteractr = false
var canInteractb = false
var canInteracty = false
var canInteractg = false

var conr = false
var conb = false
var cony = false
var cong = false

var completer = false
var completeb = false
var completey = false
var completeg = false

func _ready():
	$red/Label.hide()
	$blue/Label.hide()
	$yellow/Label.hide()
	$green/Label.hide()
	$redconnect/Label.hide()
	$blueconnect/Label.hide()
	$yellowconnect/Label.hide()
	$greenconnect/Label.hide()
	

func _on_red_body_entered(body):
	if body.name == "player":
		canInteractr = true
		$red/Label.show()
		
func _on_blue_body_entered(body):
	if body.name == "player":
		canInteractb = true
		$blue/Label.show()
			
func _on_yellow_body_entered(body):
	if body.name == "player":
		canInteracty = true
		$yellow/Label.show()
		
func _on_green_body_entered(body):
	if body.name == "player":
		canInteractg = true
		$green/Label.show()
		
func _input(event):
	if Input.is_action_just_pressed("ui_accept") and canInteractr == true:
		$red/AnimatedSprite.play("select")
		redselect = true
		$red/Label.hide()
	if Input.is_action_just_pressed("ui_accept") and canInteractb == true:
		$blue/AnimatedSprite.play("select")
		blueselect = true
		$blue/Label.hide()
	if Input.is_action_just_pressed("ui_accept") and canInteracty == true:
		$yellow/AnimatedSprite.play("select")
		yelselect = true
		$yellow/Label.hide()
	if Input.is_action_just_pressed("ui_accept") and canInteractg == true:
		$green/AnimatedSprite.play("select")
		greenselect = true
		$green/Label.hide()
	if Input.is_action_just_pressed("ui_accept") and conr == true:
		$red/AnimatedSprite.play("connect")
		completer = true
		$redconnect/Label.hide()
		checkComplete()
	if Input.is_action_just_pressed("ui_accept") and conb == true:
		$blue/AnimatedSprite.play("connect")
		completeb = true
		$blueconnect/Label.hide()
		checkComplete()
	if Input.is_action_just_pressed("ui_accept") and cony == true:
		$yellow/AnimatedSprite.play("connect")
		completey = true
		$yellowconnect/Label.hide()
		checkComplete()
	if Input.is_action_just_pressed("ui_accept") and cong == true:
		$green/AnimatedSprite.play("connect")
		completeg = true
		$greenconnect/Label.hide()
		checkComplete()
	
func checkComplete():
	if completeb and completeg and completer and completey:
		$Sprite3.hide()
		$Sprite4.hide()
		Transition.change_scene("res://act3/scene2/bedroom2.tscn")

func _on_red_body_exited(body):
	if body.name == "player":
		canInteractr = false
		$red/Label.hide()

func _on_blue_body_exited(body):
	if body.name == "player":
		canInteractb = false
		$blue/Label.hide()

func _on_yellow_body_exited(body):
	if body.name == "player":
		canInteracty = false
		$yellow/Label.hide()

func _on_green_body_exited(body):
	if body.name == "player":
		canInteractg = false
		$green/Label.hide()


func _on_redconnect_body_entered(body):
	if body.name == "player" and redselect == true:
		conr = true
		$redconnect/Label.show()

func _on_redconnect_body_exited(body):
	if body.name == "player":
		conr = false
		$redconnect/Label.hide()

func _on_blueconnect_body_entered(body):
	if body.name == "player" and blueselect == true:
		conb = true
		$blueconnect/Label.show()

func _on_blueconnect_body_exited(body):
	if body.name == "player":
		conb = false
		$blueconnect/Label.hide()

func _on_yellowconnect_body_entered(body):
	if body.name == "player" and yelselect == true:
		cony = true
		$yellowconnect/Label.show()


func _on_yellowconnect_body_exited(body):
	if body.name == "player":
		cony = false
		$yellowconnect/Label.hide()


func _on_greenconnect_body_entered(body):
	if body.name == "player" and greenselect == true:
		cong = true
		$greenconnect/Label.show()


func _on_greenconnect_body_exited(body):
	if body.name == "player":
		cong = false
		$greenconnect/Label.hide()
