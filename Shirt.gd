extends Pickable
class_name Shirt

func _ready():	
	self.paint_alternatives = 3

func change_sprite():
	self.sprite.frame = self.painted*4 + int(self.dirty) + int(self.hole)*2
	
