extends Pickable
class_name Shirt
	
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
	
func _ready():
	change_sprite()
	
	
func set_dirty(value : bool): 
	dirty = value
	change_sprite()

func set_broken(value : bool):
	broken = value
	change_sprite()

	
func set_painted(value : int):
	painted = value
	change_sprite()
	
	

func set_patched(value : bool):
	patched = value
	change_sprite()

	
func set_hole(value: bool):
	hole = value
	change_sprite()
	

	
func change_sprite():
	print(painted)
	var val = painted*4 + int(dirty) + int(hole)*2
	print (val)
	sprite.frame = val
	

