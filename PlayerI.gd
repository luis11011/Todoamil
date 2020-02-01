extends KinematicBody2D
class_name Player


onready var interact_area : Area2D = $Interactuator as Area2D


func interact():
	var object := interact_area.get_overlapping_areas()[0] as Interactuable
	call(object.method_to_call, object)

	
func pickup(object : Node):
	if object.get_parent():
		object.get_parent().remove_child(object)
	get_tree().get_node('Slots').add_child(object)


func empty_method(object : Node):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
