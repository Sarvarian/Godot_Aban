tool
extends Control


var aban : EditorPlugin = null


func _ready() -> void:
	for c in $Margin/Major.get_children():
		c.aban = aban
