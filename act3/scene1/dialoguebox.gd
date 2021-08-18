extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialogue = [
#<<<<<<< HEAD
#=======
		" HELLO THERE, WHAT IS YOUR NAME?",
		"MY NAME IS PARIS O'BRIEN.",
		"WHAT ARE YOU IN FOR?",
		"...DON'T WANT TO SAY? I UNDERSTAND.",
		"I WOULD TELL YOU WHY I'M HERE, BUT FRANKLY I CAN'T REMEMBER A THING.",
		"...",
		"NOW THAT I THINK ABOUT IT, HAVE I MET YOU BEFORE?",
		"OH, I'M SORRY. MUST BE SEEING THINGS.",
		"... WHAT'S THAT? YOU THINK YOU CAN HELP REGAIN MY MEMORIES?",
		"WELL I DON'T KNOW HOW THAT WOULD WORK, BUT I'M WILLING TO GIVE IT A TRY."
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_completed(object, key):
	pass # Replace with function body.
