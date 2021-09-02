extends Node2D

var dialogue = [
	"''ONCE UPON A TIME, THERE WAS AN OLD CITY.''",
	"''THIS CITY WAS UNLIKE THE OTHER CITIES OF THE ERA: THEY WERE OVERPOPULATED AND DESTITUTE WHILE IT WAS PEACEFUL AND PROSPEROUS.''",
	"''THE CITIZENS OF THE CITY WERE HAPPY, AND THEY CELEBRATED THIS HAPPINESS WITH FEASTING AND FESTIVITIES.''",
	"''THE CHILDREN RAN IN THE STREETS WITH STICKY FINGERS AND SWEET-SMELLING PASTRIES,''",
	"''WHILE THE ADULTS GATHERED TO GIVE THANKS AND DRINK.''",
	"''THEY DANCED AND SANG WELL INTO THE NIGHT, AND NOT ONE OF THEM THOUGHT OF WHY THEY WERE CELEBRATING.''",
	"''WHY WOULD THEY? THEY HAD ENOUGH TO FILL THEIR BELLIES AND EVERY DAY WAS SPENT IN LESIURE.''",
	"''HOWEVER, THE CITY HELD A TERRIBLE SECRET.''",
	"''BELOW THE FESTIVITIES, BELOW THE GILDED JOY OF THE ALLEYWAYS AND SIDEWALKS, LAY THE SOURCE OF HAPPINESS, THE CULMINATION OF MISERY.''",
	"''FOR EVERY HAPPINESS THERE EXISTED A SACRIFICE, AND FOR A PERFECT CITY, THAT SACRIFICE MUST HAVE BEEN EQUALLY PERFECT IN SUFFERING.''",
	"''TRAPPED BELOW THE CITY, IN SQUALOR AND IN FILTH, WRAPPED IN INVISIBLE CHAINS, LIVED A CHILD.''",
	"''IT HAD NEVER BEEN ABOVE GROUND, NEVER SEEN THE FESTIVALS, NEVER FELT THE HEAT OF THE BLACK SUN.''",
	"''IT COULD ONLY LISTEN TO THE SOUND OF FEET PATTERING ABOVE, AND THE DEEP BEAT OF THE FESTIVAL DRUM RUMBLING THROUGH.''",
	"''ITS WORLD WAS ONE OF DARKNESS AND DECAY, AND EACH CITIZEN KNEW THIS IN THEIR HEART.''",
	"''IF THIS CHILD IS SAVED, THE CITY WILL BE LOST'. THIS PHRASE LINGERED IN EVERY MIND, UNDER THE TIP OF EACH TOUNGUE IN AN UNSAID AGREEMENT.",
	"''ONE FOR MANY, THEY THOUGHT, AND CARRIED ON, BURYING THEIR DISCOMFORT UNDER THE GLAMOUR OF SHINING RUBY ROOFTOPS AND SMILING FAMILY.''",
	"''AND YET, THERE ARE THOSE WHO CHOOSE ANOTHER PATH, ONE THAT LEADS OUT OF CITY AND INTO THE UNKNOWN.''",
	"''THEY WALK WITH A PURPOSE, BUT WHERE ARE THEY GOING? I COULDN'T TELL YOU. AT LEAST THEY SEEM TO KNOW, THE ONES WHO WALK AWAY FROM OMELAS . . .''",
]

var dialogue_index = 0
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()
	$Sprite/AnimationPlayer.play("New Anim")
	
func _process(delta):
	$"dialoguebox/continuesprite".visible = finished
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		if dialogue_index == 2:
			$Sprite2/AnimationPlayer.play("New Anim")
			yield(get_tree().create_timer(1), "timeout")
			$Sprite/AnimationPlayer.play_backwards("New Anim")
		if dialogue_index == 5:
			$Sprite4/AnimationPlayer.play("New Anim")
			yield(get_tree().create_timer(1), "timeout")
			$Sprite2/AnimationPlayer.play_backwards("New Anim")
		if dialogue_index == 7:
			$Sprite6/AnimationPlayer.play("New Anim")
			yield(get_tree().create_timer(1), "timeout")
			$Sprite4/AnimationPlayer.play_backwards("New Anim")
		if dialogue_index == 9:
			$Sprite7/AnimationPlayer.play("New Anim")
			$Sprite9/AnimationPlayer.play("New Anim")
			yield(get_tree().create_timer(1), "timeout")
			$Sprite6/AnimationPlayer.play_backwards("New Anim")
		if dialogue_index == 10:
			$Sprite8/AnimationPlayer.play("New Anim")
		if dialogue_index == 16:
			$Sprite10/AnimationPlayer.play("New Anim")
		if dialogue_index == 18:
			Transition.change_scene("res://drawncutscenes/smolParis2.tscn")
		
func load_dialogue():
	$dialoguebox.show()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$dialoguebox/Type.play()
		finished = false
		$dialoguebox/RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$dialoguebox/RichTextLabel.percent_visible = 0
		$dialoguebox/Tween.interpolate_property(
			$dialoguebox/RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$dialoguebox/Tween.start()
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$dialoguebox/Type.stop()
	dialogue_index +=1
