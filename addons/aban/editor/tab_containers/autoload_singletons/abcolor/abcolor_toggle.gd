tool
extends CheckButton


var aban : EditorPlugin = null


func _on_AbColorToggle_toggled(button_pressed : bool) -> void:
	if button_pressed:
		aban.add_to_autoload_singletons("AbColor", "res://addons/aban/singletons/ab_color.gd")
		text = "O AbColor Enabled"
	else:
		aban.remove_from_autoload_singletons("AbColor")
		text = "X AbColor Disabled"
