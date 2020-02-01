extends Path2D


var point := 72.0
onready var path_follow = $PathFollow2D as PathFollow2D

enum { ARRIVING, WAITING, GOING }

export var speed = 100.0

var state := ARRIVING

func _ready():
	point = curve.get_closest_offset(Vector2(280,140)) as float
	

func _process(delta):
	if state == ARRIVING:
		path_follow.offset += delta*speed
		if path_follow.offset>point:
			path_follow.offset = point
			state = WAITING


