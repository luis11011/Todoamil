extends Interactuable

signal item_dropped

func interact():
	var item = get_from_slot(0)

	if item:
		if item.done:
			item.queue_free()
			emit_signal("item_dropped")
