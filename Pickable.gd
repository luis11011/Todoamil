extends Interactuable
class_name Pickable

var done := false
	
func interact():
	var new_parent := $"/root/World/Slots" as Node2D
	if get_parent():
		get_parent().remove_child(self)
	new_parent.add_child(self)
	
func put():
	var new_parent := $"/root/World/TablePosition" as Node2D
	if get_parent():
		get_parent().remove_child(self)
	new_parent.add_child(self)

