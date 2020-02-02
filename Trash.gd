extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item and !item.done and !item.dirty:
		item.done = true
		item.dirty = true
		item.change_sprite()
		return true
