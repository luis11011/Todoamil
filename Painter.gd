extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item and !item.done:
		item.done = true
		item.toggle_paint()
		item.change_sprite()
		$AudioStreamPlayer.pitch_scale = rand_range(1.5,1.8)
		$AudioStreamPlayer.play(0.0)
		return true
