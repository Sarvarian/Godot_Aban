tool
class_name AbTimeStatedButton
extends AbAsset


func _enter_tree() -> void:
	if not OS.has_feature("editor"):
		return
	add_child(load("res://addons/aban/assets/time_stated_button/TimeStatedButton.tscn").instance())


