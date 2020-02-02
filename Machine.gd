extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item and !item.done and item.hole:
		item.done = true
		item.hole = false
		item.change_sprite()
		$Sprite.animation = "active"
		yield(get_tree().create_timer(2.5),"timeout")
		$Sprite.animation = "idle"
