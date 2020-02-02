extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item and item.wash_machine():
		$Sprite.animation = "active"
		$AudioStreamPlayer.pitch_scale = rand_range(0.8,1.2)
		$AudioStreamPlayer.play(0.0)
		yield(get_tree().create_timer(2.5),"timeout")
		$Sprite.animation = "idle"
		return true
