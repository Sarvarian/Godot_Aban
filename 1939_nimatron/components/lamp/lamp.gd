extends Node2D


enum State {OFF, ON}

export(State) var state : bool = State.ON setget ,is_on
export(int, 1, 4) var color_in_pallete : = 1


func _ready() -> void:
	$Painter.color_in_pallete = color_in_pallete
	if is_on():
		turn_on()
	else:
		turn_off()


func _process(_delta : float) -> void:
	if not OS.is_debug_build():
		return
	if state:
		$Painter.paint_on()
	else:
		$Painter.paint_off()


func turn_on() -> void:
	$Painter.paint_on()
	state = State.ON


func turn_off() -> void:
	$Painter.paint_off()
	state = State.OFF


func is_on() -> bool:
	return state









