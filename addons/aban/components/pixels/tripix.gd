tool
class_name AbTriPix, "res://addons/aban/icons/tripix.png"
extends AbPix


func _enter_tree() -> void:
	texture = load("res://addons/aban/components/pixels/textures/tripix.png")
	set_script(null)
