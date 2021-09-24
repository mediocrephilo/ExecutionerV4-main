extends Node2D
const KNIFE = preload("res://act3/scene2/knife.tscn")
const KNIFE2 = preload("res://act3/scene2/knife2.tscn")
const KNIFE3 = preload("res://act3/scene2/knife3.tscn")
const KNIFE4 = preload("res://act3/scene2/knife4.tscn")
const KNIFE5 = preload("res://act3/scene2/knife5.tscn")
const KNIFE6 = preload("res://act3/scene2/knife6.tscn")
const KNIFE7 = preload("res://act3/scene2/knife7.tscn")

func _ready():
	gameSaver.save_game("res://Act3/scene2/kitchen.tscn")
	
func _on_Timer_timeout():
	var knife = KNIFE.instance()
	add_child(knife)
	var knife5 = KNIFE5.instance()
	add_child(knife5)
	

func _on_Timer2_timeout():
	var knife7 = KNIFE7.instance()
	add_child(knife7)
	var knife4 = KNIFE4.instance()
	add_child(knife4)
	var knife2 = KNIFE2.instance()
	add_child(knife2)


func _on_Timer3_timeout():
	var knife6 = KNIFE6.instance()
	add_child(knife6)
	var knife3 = KNIFE3.instance()
	add_child(knife3)
