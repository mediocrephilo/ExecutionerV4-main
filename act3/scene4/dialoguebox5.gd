extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var dialogue = [
		". . . Oh dear. This one's a long one. Then I'll begin - pay attention.",
		"''The two visitors had never seen such brightness before, and they could not look at it directly, for fear of being burnt.''",
		"''Suddenly, a thought came to them: 'If the light is so bright from far away . . . our son must be in incredible pain on the surface!'''",
		"''Thus, the parents brought out their tubes of still-water, and poured them out onto the flames, in the hopes that they would subside.''",
		"''However, the bird on the surface, with his flaming talons that allowed him to see, knew nothing of this.''",
		"''The droplets fell and fell, and scattered all about the star's surface. However, the flames were too strong, and continued to burn with passion.''",
		"''But the bird, standing, waiting for his parents' arrival, was not so lucky to espcape the downpour.''",
		"''The still-water rained down and quenched his talons, exposing him for the first time to the cold whiteness around him.''",
		"''He screamed, eyes burning, feathers turning into ash. He burned and burned until there was nothing Left but dust.''",
]
var dialogue_index = 0
var finished = false
var canInteract = false
func _ready():
		load_dialogue()
		
func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		
func load_dialogue():
	$TextureRect.show()
	$RichTextLabel.show()
	if dialogue_index < dialogue.size():
		finished = false
		$Type.play()
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index += 1
