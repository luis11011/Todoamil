extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item:
		item.done = true
		var value = (item.painted + 1)%3
		print (value)
		item.painted = value
		print(item)
