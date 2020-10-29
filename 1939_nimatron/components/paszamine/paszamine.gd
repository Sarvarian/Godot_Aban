extends Panel


func _ready() -> void:
	if AbColor.palette:
		modulate = AbColor.palette[0]


func _process(_delta : float) -> void:
	if not OS.is_debug_build():
		return
	if AbColor.palette:
		modulate = AbColor.palette[0]
	pass
