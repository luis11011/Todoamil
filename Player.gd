extends KinematicBody2D
class_name Player


onready var interact_area : Area2D = $Interactuator as Area2D
onready var asprite : AnimatedSprite = $AnimatedSprite as AnimatedSprite

var MAX_SPEED = 120
var ACCELERATION = 500
var motion = Vector2.ZERO
		

func  _physics_process(delta): 
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		asprite.animation = 'idle'
		apply_friction(ACCELERATION * delta)
	else: 
		asprite.animation = 'walk'
		if axis.x!=0:
			asprite.flip_h = axis.x<0
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
	motion += acceleration
	motion = motion.clamped(MAX_SPEED )


func interact():
	print("player interact()")
	var areas := interact_area.get_overlapping_areas()
	if areas.size()>0:
		for area in areas:
			area.interact()
