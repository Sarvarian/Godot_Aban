extends Node2D


enum State {Off, On}

export(State) var state : int = State.Off



func _ready() -> void:
	if state:
		$Painter.paint_on()
	else:
		$Painter.paint_off()


func _process(_delta : float) -> void:
	if not OS.is_debug_build():
		return
	
	if state:
		$Painter.paint_on()
	else:
		$Painter.paint_off()


func off() -> void:
	state = State.Off
	$Painter.paint_off()
	pass

func on() -> void:
	state = State.On
	$Painter.paint_on()
	pass
