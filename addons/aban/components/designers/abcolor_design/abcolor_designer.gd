class_name AbColorDesigner
extends AbDesigner


onready var color_picker_scene : PackedScene = preload("res://addons/aban/components/designers/abcolor_design/color_picker.tscn")
onready var scroll_con : ScrollContainer = preload("res://addons/aban/components/designers/abcolor_design/scroll_con.tscn").instance()
onready var vbox_con : VBoxContainer = preload("res://addons/aban/components/designers/abcolor_design/vbox_con.tscn").instance()

func _ready() -> void:
	add_child(scroll_con)
	scroll_con.add_child(vbox_con)
	
	for i in AbColor.palette.size():
		var cpb : HBoxContainer = color_picker_scene.instance()
		cpb.palette_index = i
		vbox_con.add_child(cpb)

