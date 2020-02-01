extends KinematicBody2D
class_name Player


onready var interact_area : Area2D = $Interactuator as Area2D

var MAX_SPEED = 120
var ACCELERATION = 500
var motion = Vector2.ZERO
		

func  _physics_process(delta): 
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION * delta)
	else: 
		apply_movement(axis * ACCELERATION * delta)
	motion = move_and_slide(motion)


func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		interact()
		

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()
	
	
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * (amount*1.5)
	else:
		motion = Vector2.ZERO


func apply_movement(acceleration):
	print(acceleration)
	motion += acceleration
	motion = motion.clamped(MAX_SPEED )


func interact():
	var areas := interact_area.get_overlapping_areas()
	print(areas)
	if areas.size()>0:
		var object = areas[0] as Interactuable
		object.interact()
		var tomado = object.name
