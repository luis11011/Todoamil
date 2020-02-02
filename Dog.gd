extends Pickable
class_name Dog

func _ready():	
	self.paint_alternatives = 3

func change_sprite():
	self.sprite.frame = self.painted*3 + int(self.hole) + int(self.broken)*2
	self.sprite_dirty.visible = self.dirty
	
func wash_machine():
	if !self.done and self.dirty:
		self.done = true
		self.dirty = false
		self.broken = true
		self.hole = false
		self.play()
		change_sprite()
		return true
	return false
	
