extends Node2D


var client_array := []
var client_array_constant := []

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
	
	generate_array()
	yield(get_tree().create_timer(2.0),"timeout")
	$Title.visible = false
	$ClientPath.start()


func generate_array():
	var file = File.new()
	file.open("res://Levels.json", File.READ)
	var json = file.get_as_text()
	file.close()
	var json_result = JSON.parse(json).result
	client_array_constant = json_result.levels[0]
	client_array = client_array_constant
	


func generate_pickable():
	var client_from_array = client_array.pop_front()
	if client_from_array == null:
		client_array = client_array_constant
		client_from_array = client_array.pop_front()
		
		
	var wanted = Manager.pickables[client_from_array[0]].instance() as Node
	add_child(wanted)
	wanted.dirty = client_from_array[WANTED][DIRTY]
	wanted.broken = client_from_array[WANTED][BROKEN]
	wanted.painted = client_from_array[WANTED][PAINTED]
	wanted.hole = client_from_array[WANTED][HOLE]
	wanted.change_sprite()
	wanted.dialog()	
		
	var object = Manager.pickables[client_from_array[0]].instance() as Node
	add_child(object)
	object.dirty = client_from_array[STATUS][DIRTY]
	object.broken = client_from_array[STATUS][BROKEN]
	object.painted = client_from_array[STATUS][PAINTED]
	object.hole = client_from_array[STATUS][HOLE]
	object.change_sprite()
	object.put()
	
	
func on_put_item():
	generate_pickable()


func _on_ClientPath_client_going():
	
	var hint_node = $Dialog.get_children()[0]
	var nodes = $TablePosition.get_children()
	var node = null
	for n in nodes:
		if n.is_in_group('Pickables'):
			node = n
	
	var properties = ['dirty','hole','painted','broken']
	
	var good = true
	
	for property in properties:
		if node[property]!=hint_node[property]:
			good = false
			break
			
	play_client(good)
	
	node.queue_free()
	hint_node.queue_free()


func play_client(good):
	if good:
		$ClienteFeliz.play()
	else:
		$ClienteEnojado.play()
	
