extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tween_out = get_node("Tween")

export var transition_duration = 2.00
export var transition_type = 1 # TRANS_SINE

# Called when the node enters the scene tree for the first time.
func playsound():
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()

func stopsound():
	$AudioStreamPlayer.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func fade_out():
	# tween music volume down to 0
	$Tween.interpolate_property($AudioStreamPlayer, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	$Tween.start()
	# when the tween ends, the music will be stopped

func _on_Tween_tween_completed(_object, _key):
	# stop the music -- otherwise it continues to run at silent volume
	$AudioStreamPlayer.stop()
