extends Path2D


var middle_point := 72.0
var end_point := 140.0
onready var path_follow = $PathFollow2D as PathFollow2D

signal state_changed(state)
signal put_item

enum { ARRIVING, WAITING, GOING, END }

export var speed = 100.0

var state := ARRIVING setget set_state

func _ready():
	self.state = ARRIVING
	middle_point = curve.get_closest_offset(Vector2(280,140)) as float
	end_point = curve.get_baked_length() as float
	

func _process(delta):
	if state != WAITING and state != END:
		path_follow.offset += delta*speed
		if path_follow.unit_offset>=0.99 and state==GOING:
			path_follow.offset = end_point
			self.state = END
		elif path_follow.offset>middle_point and state==ARRIVING:
			path_follow.offset = middle_point
			self.state = WAITING


func set_state(value : int):
	state = value
	emit_signal("state_changed",state)
	if state == WAITING:
		emit_signal("put_item")
	print("state",state)
	if state==END:
		yield(get_tree().create_timer(1.4),"timeout")
		state = ARRIVING
		$PathFollow2D/Client.flip_h = false
		$PathFollow2D/Client.frame += 1
		emit_signal("state_changed",state)

	
func on_item_dropped():
	yield(get_tree().create_timer(0.7),"timeout")
	self.state = GOING
	$PathFollow2D/Client.flip_h = true
	
