extends Interactuable
class_name Pickable

	
func interact():
	print("picked up")
	var new_parent := get_tree().get_root().get_node('World/Slots') as Node2D
	if get_parent():
		get_parent().remove_child(self)
	new_parent.add_child(self)

