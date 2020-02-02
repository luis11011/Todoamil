extends Node
class_name Interactuable

func interact():
	pass
	
func get_from_slot(idx : int) -> Node:
	var items := $"/root/World/Slots".get_children()
	
	if items.size()>idx:
		return items[idx] as Node
	return null
