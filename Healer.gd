extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item and !item.done and item.broken:
		item.done = true
		item.broken = false
		item.change_sprite()
