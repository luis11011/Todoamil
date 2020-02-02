extends Sprite


func _on_ClientPath_client_going():
	visible = false


func _on_ClientPath_put_item():
	visible = true
