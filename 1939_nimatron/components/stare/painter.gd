extends Node


onready var base : Sprite = get_node("../Base")
onready var center_light : Sprite = get_node("../CenterLight")
onready var lower_shadow : Sprite = get_node("../lower_shadow")
onready var upper_shadow : Sprite = get_node("../upper_shadow")


func paint_off() -> void:
	if AbColor.palette.size() > 8:
		base.modulate = AbColor.palette[8]
		center_light.modulate = AbColor.palette[8]
		lower_shadow.modulate = AbColor.palette[8]
		upper_shadow.modulate = AbColor.palette[8]
	
	base.modulate.v -= .5
	center_light.modulate.a = 0
	lower_shadow.modulate.a = 0
	upper_shadow.modulate.a = 0
	pass


func paint_on() -> void:
	if AbColor.palette.size() > 8:
		base.modulate = AbColor.palette[8]
		center_light.modulate = AbColor.palette[8]
		lower_shadow.modulate = AbColor.palette[8]
		upper_shadow.modulate = AbColor.palette[8]
	
	upper_shadow.modulate.v -= .1
	lower_shadow.modulate.v -= .24
	pass



