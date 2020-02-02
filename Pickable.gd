extends Interactuable
class_name Pickable
  
onready var sprite = get_node("Sprite")

export var paint_alternatives = 2

var dirty := false # setget set_dirty
var broken := false # setget set_broken
var painted := 0 # setget set_painted
var patched := false # setget set_patched
var hole := false # setget set_hole

var done := false

	
func interact():
	print("interact")
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
	
	
func change_sprite():
	pass


func wash_machine():
	dirty = false

func toggle_paint():
	painted = (painted + 1)%paint_alternatives
