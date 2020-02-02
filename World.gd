extends Node2D


var client_array := []

enum {
	TYPE,
	STATUS,
	GOAL
}

enum {
	DIRTY,
	BROKEN,
	HOLE,
	PAINTED,
	PATCHED
}

func _ready():
	var file = File.new()
	file.open("res://Levels.json", File.READ)
	var json = file.get_as_text()
	file.close()
	var json_result = JSON.parse(json).result
	
	client_array = json_result.levels[0]

	# print(client_array)

func generate_pickable():
	var client_from_array = client_array.pop_front()
	if !client_from_array:
		pass
		
	var object = Manager.pickables[client_from_array[0]].instance() as Node
	
	add_child(object)
	
	object.dirty = client_from_array[STATUS][DIRTY]
	object.broken = client_from_array[STATUS][BROKEN]
	object.painted = client_from_array[STATUS][PAINTED]
	object.patched = client_from_array[STATUS][PATCHED]
	object.hole = client_from_array[STATUS][HOLE]
	
	object.change_sprite()
	
	object.put()
	
	
	
func on_put_item():
	generate_pickable()
