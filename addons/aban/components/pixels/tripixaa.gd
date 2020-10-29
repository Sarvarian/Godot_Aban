tool
class_name AbTriPixAA, "res://addons/aban/icons/tripix.png"
extends AbPix


func _enter_tree() -> void:
	if not OS.has_feature("editor"):
		return
	texture = load("res://addons/aban/components/pixels/textures/tripixaa.png")
