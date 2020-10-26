tool
extends TabContainer


var aban : EditorPlugin = null setget set_aban, get_aban


func set_aban(value : EditorPlugin) -> void:
	aban = value
	for c in get_child(0).get_children():
		c.aban = aban


func get_aban() -> EditorPlugin:
	return aban
