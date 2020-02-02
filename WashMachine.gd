extends Interactuable

func interact():
	var item = get_from_slot(0)

	if item and item.wash_machine():
		$Sprite.animation = "active"
		yield(get_tree().create_timer(2.5),"timeout")
		$Sprite.animation = "idle"
		return true
