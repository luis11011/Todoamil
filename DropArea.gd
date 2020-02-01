extends Interactuable


func interact():
	var item = get_tree().get_root().get_node('World/Slots').get_children()[0]
	if item.done:
		# check_status
		item.queue_free()
