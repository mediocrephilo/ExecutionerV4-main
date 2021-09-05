extends Area2D


var dialogue = [
	"HMM . . . 'BEFORE THE CATACLYSMS: CIVILIZATION AND DIPLOMACY' BY TIMOTHIE SATO. SOUNDS . . . RIVETING.",
]
var canInteract = false
var dialogue_index = 0
var finished = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"dialoguebox/continuesprite".show() == finished
	if canInteract == true and Input.is_action_just_pressed("ui_accept"):
		if dialogue_index == 0:
			load_dialogue()
		if dialogue_index == 1:
			Transition.change_scene("res://act3/scene2/book1.tscn")
		
func load_dialogue():
	$dialoguebox/TextureRect.show()
	$dialoguebox/RichTextLabel.show()
	if dialogue_index < dialogue.size():
		finished = false
		$dialoguebox/Type.play()
		$dialoguebox/RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$dialoguebox/RichTextLabel.percent_visible = 0
		$dialoguebox/Tween.interpolate_property(
			$dialoguebox/RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$dialoguebox/Tween.start()
	else:
		queue_free()

func _on_book_body_entered(body):
	$AnimatedSprite.play()
	if body.name == "player":
		canInteract = true


func _on_book_body_exited(body):
	$AnimatedSprite.stop()
	if body.name == "player":
		canInteract = false


func _on_Tween_tween_completed(_object, _key):
	finished = true
	$dialoguebox/Type.stop()
	dialogue_index += 1
