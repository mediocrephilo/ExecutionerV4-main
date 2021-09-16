extends Node2D



var save_nodes = get_tree().get_nodes_in_group("Persist")

	
func save():
	var save_dict = {
		"filename" : get_filename(),
	}
	return save_dict

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:

		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue


		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue


		var node_data = node.call("save")


		save_game.store_line(to_json(node_data))
	save_game.close()
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return 

	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()

	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():

		var node_data = parse_json(save_game.get_line())


		var new_object = load(node_data["filename"]).instance()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])


		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])

	save_game.close()
