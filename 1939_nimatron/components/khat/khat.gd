extends Node2D


signal lamp_khamoosh(Node2D)
signal khat_bazgasht()


var gets_off : Array = []
var is_lock : bool = false


func turn_a_light_off() -> void:
	if is_lock:
		return
	
	for c in get_children():
		if c.is_on():
			gets_off.append(c)
			c.turn_off()
			emit_signal("lamp_khamoosh", self)
			return
	reset_lights()


func reset_lights() -> void:
	for l in gets_off:
		l.turn_on()
		emit_signal("khat_bazgasht")


func submit_changes() -> void:
	gets_off.clear()


func how_many_are_on() -> int:
	var counter : int = 0
	
	for l in get_children():
		if l.is_on():
			counter += 1
	
	return counter


func lock() -> void:
	is_lock = true

func unlock() -> void:
	is_lock = false


func remaning() -> int:
	var remaning : int = 0
	for c in get_children():
		if c.is_on():
			remaning += 1
	return remaning
