extends Interactuable


func interact():
	var items := get_tree().get_root().get_node('World/Slots').get_children()
	if items.size()>0:
		var item := items[0] as Node
		if item.done:
			# check_status
			item.queue_free()
		item.queue_free()
