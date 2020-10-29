tool
extends EditorPlugin


var autoload_singletons : PoolStringArray = []


func _enter_tree():
	add_autoload_singleton("AbColor", "res://addons/aban/singletons/ab_color.gd")
	autoload_singletons.append("AbColor")
	pass


func _exit_tree():
	for s in autoload_singletons:
		remove_autoload_singleton(s)
	pass


func has_main_screen():
	return false


func make_visible(visible):
	pass


func get_plugin_name():
	return "Aban"


func get_plugin_icon():
	return preload("res://addons/aban/icons/abna.png")
