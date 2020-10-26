extends Timer


var line : Node2D = null
var remaining : int = 0


func start_offing(target : Node2D, count : int) -> void:
	line = target
	remaining = count
	start()


func _on_LightOffer_timeout():
	line.unlock()
	line.turn_a_light_off()
	line.lock()
	remaining -= 1
	if remaining > 0:
		start()
	else:
		line.submit_changes()
		get_parent().cpu_done()
