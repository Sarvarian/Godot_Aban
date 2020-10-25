extends Node2D


enum State {OFF, ON}

export(State) var state : bool = State.ON setget ,is_on


func _ready() -> void:
	if is_on():
		turn_on()
	else:
		turn_off()


func turn_on() -> void:
	$AnimatedSprite.play("On")
	state = State.ON


func turn_off() -> void:
	$AnimatedSprite.play("Off")
	state = State.OFF


func is_on() -> bool:
	return state


func remaning() -> int:
	var remaning : int = 0
	for c in get_children():
		if c.is_on():
			remaning += 1
	return remaning








