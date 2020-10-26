tool
extends EditorPlugin


const MainPanel = preload("res://addons/aban/editor/main_panel.tscn")

var main_panel_instance
var autoload_singletons : PoolStringArray = []
var custom_types : PoolStringArray = []


func _enter_tree():
	add_to_custom_types(
		"AbSetting",
		"Node",
		preload("res://addons/aban/settings/settings.gd"),
		preload("res://addons/aban/settings/settings.png"))
	
	main_panel_instance = MainPanel.instance()
	main_panel_instance.aban = self
	# Add the main panel to the editor's main viewport.
	get_editor_interface().get_editor_viewport().add_child(main_panel_instance)
	# Hide the main panel. Very much required.
	make_visible(false)
	pass


func _exit_tree():
	if main_panel_instance:
		main_panel_instance.queue_free()
	
	for s in autoload_singletons:
		remove_autoload_singleton(s)
	for t in custom_types:
		remove_custom_type(t)
	
	pass


func has_main_screen():
	return true


func make_visible(visible):
	pass


func get_plugin_name():
	return "Aban"


func get_plugin_icon():
	return preload("res://addons/aban/abna.png")


func add_to_autoload_singletons(
	name : String,
	path : String
	) -> void:
	
	add_autoload_singleton(name, path)
	autoload_singletons.append(name)


func remove_from_autoload_singletons(name : String) -> void:
	remove_autoload_singleton(name)
	for i in range(autoload_singletons.size()):
		if autoload_singletons[i] == name:
			autoload_singletons.remove(i)


func add_to_custom_types(
	name : String,
	base : String,
	script : Script,
	icon : Texture
	) -> void:
	
	add_custom_type(name, base, script, icon)
	custom_types.append(name)


func remove_from_custom_type(name : String) -> void:
	remove_custom_type(name)
	for i in range(custom_types.size()):
		if custom_types[i] == name:
			custom_types.remove(i)
