extends Interactuable

signal item_dropped


func play_audio():
	$AudioStreamPlayer.pitch_scale = rand_range(0.8,1.2)
	$AudioStreamPlayer.play()


func interact():
	
	if get_parent().get_children().size()>1:
		play_audio()
		return false
	
	var item = get_from_slot(0)
	

	if item and item.done:

		play_audio()
		item.drop()
		emit_signal("item_dropped")
		return true
