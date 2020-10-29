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


func _on_Sabt_pressed() -> void:
	modulate.v = .8


func _on_Sabt_released() -> void:
	modulate.v = 1

