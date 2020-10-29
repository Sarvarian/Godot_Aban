extends TouchScreenButton


enum State {Red, Green}


export var state : int = State.Red


func _ready() -> void:
	if state:
		green()
	else:
		red()


func _process(_delta : float) -> void:
	if not OS.is_debug_build():
		return
	if state:
		green()
	else:
		red()
	pass


func red() -> void:
	state = State.Red
	$Painter.paint_red()


func green() -> void:
	state = State.Green
	$Painter.paint_green()


func _on_sabt_pressed():
	modulate.v -= .2


func _on_sabt_released():
	modulate.v += .2
