extends Interactuable
class_name Pickable
  
onready var sprite = get_node("Sprite")
onready var sprite_dirty = get_node("SpriteDirty")
onready var audio_stream_player = get_node("AudioStreamPlayer")

export var paint_alternatives = 2

var pickedup := false

var dirty := false # setget set_dirty
var broken := false # setget set_broken
var painted := 0 # setget set_painted
var patched := false # setget set_patched
var hole := false # setget set_hole

var done := false

	
func interact():
	if !done:
		pickedup = true
		change_sprite()
		var new_parent := $"/root/World/Slots" as Node2D
		if get_parent():
			get_parent().remove_child(self)
		new_parent.add_child(self)
		return true


func put():
	pickedup = false
	change_sprite()
	var new_parent := $"/root/World/TablePosition" as Node2D
	if get_parent():
		get_parent().remove_child(self)
	new_parent.add_child(self)


func drop():
	change_sprite()
	var new_parent := $"/root/World/TablePosition" as Node2D
	if get_parent():
		get_parent().remove_child(self)
	new_parent.add_child(self)
	
	
func dialog():
	pickedup = true
	change_sprite()
	var new_parent := $"/root/World/Dialog" as Node2D
	if get_parent():
		get_parent().remove_child(self)
	new_parent.add_child(self)
	
	
func _ready():
	change_sprite()
	
	
func change_sprite():
	pass


func machine():
	if !done and hole:
		done = true
		hole = false
		change_sprite()
		return true
	return false


func wash_machine():
	if !done and dirty:
		done = true
		dirty = false
		change_sprite()
		return true
	return false


func play():
	if audio_stream_player:
		audio_stream_player.play()


func toggle_paint():
	painted = (painted + 1)%paint_alternatives
