extends Node

# Called when the node enters the scene tree for the first time.

func save_game(path):
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(path))
	save_game.close()
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return
	save_game.open("user://savegame.save", File.READ)
	var saved_path = parse_json(save_game.get_line())
	Transition.change_scene(saved_path)
	return saved_path
