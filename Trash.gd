extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item and !item.done and !item.dirty:
		item.done = true
		item.dirty = true
		$AudioStreamPlayer.pitch_scale = rand_range(0.8,1.2)
		$AudioStreamPlayer.play(0.0)
		item.change_sprite()
		return true
