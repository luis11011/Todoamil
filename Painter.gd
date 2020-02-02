extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item and !item.done:
		item.done = true
		item.toggle_paint()
		item.change_sprite()
		return true
