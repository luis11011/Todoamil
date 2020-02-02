extends Node2D


var client_array := []

enum {
	TYPE,
	STATUS,
	WANTED
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

func generate_pickable():
	var client_from_array = client_array.pop_front()
	if !client_from_array:
		pass
		
	var wanted = Manager.pickables[client_from_array[0]].instance() as Node
	add_child(wanted)
	wanted.dirty = client_from_array[WANTED][DIRTY]
	wanted.broken = client_from_array[WANTED][BROKEN]
	wanted.painted = client_from_array[WANTED][PAINTED]
	wanted.patched = client_from_array[WANTED][PATCHED]
	wanted.hole = client_from_array[WANTED][HOLE]
	wanted.change_sprite()
	wanted.dialog()	
		
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
