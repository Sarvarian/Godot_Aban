tool
extends EditorPlugin


var autoload_singletons : PoolStringArray = []


func _enter_tree():
	add_autoload_singleton("AbColor", "res://addons/aban/singletons/ab_color.gd")
	autoload_singletons.append("AbColor")
	add_autoload_singleton("AbGlobal", "res://addons/aban/singletons/ab_global.gd")
	autoload_singletons.append("AbGlobal")
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
