extends Interactuable

signal item_dropped

func interact():
	
	if get_parent().get_children().size()>1:
		return false
	
	var item = get_from_slot(0)

	if item:
		if item.done:
			item.queue_free()
			emit_signal("item_dropped")
		return true
