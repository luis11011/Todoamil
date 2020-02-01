extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item:
		item.done = true
