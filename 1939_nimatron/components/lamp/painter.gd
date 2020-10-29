extends Node


export(int, 1, 4) var color_in_pallete : = 1

onready var noor : Sprite = get_node("../Noor")
onready var halge : Sprite = get_node("../Halqe")
onready var saye_bala : Sprite = get_node("../SayeBala")
onready var saye_payin : Sprite = get_node("../SayePayin")


func paint_on() -> void:
	if AbColor.palette.size() > color_in_pallete:
		noor.modulate = AbColor.palette[color_in_pallete]
		halge.modulate = AbColor.palette[color_in_pallete]
	
	if AbColor.palette.size() > 5:
		saye_bala.modulate = AbColor.palette[5]
		saye_payin.modulate = AbColor.palette[5]
	
	saye_bala.modulate.v = .76
	saye_payin.modulate.v = .76
	halge.modulate.v = .5
	noor.modulate.v = 1


func paint_off() -> void:
	if AbColor.palette[color_in_pallete]:
		noor.modulate = AbColor.palette[color_in_pallete]
		halge.modulate = AbColor.palette[color_in_pallete]
	
	if AbColor.palette[5]:
		saye_bala.modulate = AbColor.palette[5]
		saye_payin.modulate = AbColor.palette[5]
	
	saye_bala.modulate.v = .34
	saye_payin.modulate.v = .4
	halge.modulate.v = .25
	noor.modulate.v = .5


