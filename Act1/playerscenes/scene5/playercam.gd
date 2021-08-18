extends Camera2D

func _on_player_ground_update(is_ground):
	drag_margin_v_enabled = !is_ground
