extends Pickable
class_name Baby

func _ready():	
	self.paint_alternatives = 2

func change_sprite():
	self.sprite.frame = self.painted*2 + int(self.broken) + int(self.pickedup)*4
	self.sprite_dirty.visible = self.dirty and self.pickedup
	
func wash_machine():
	return false
	
func machine():
	return false
