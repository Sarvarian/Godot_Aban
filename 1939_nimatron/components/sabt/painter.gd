extends Node


onready var sath : Sprite = get_node("../Sath")
onready var saye_vasat : Sprite = get_node("../SayeVasat")
onready var saye_bala : Sprite = get_node("../SayeBala")
onready var saye_payin : Sprite = get_node("../SayePayin")


func paint_red() -> void:
	if AbColor.palette.size() > 6:
		sath.modulate = AbColor.palette[6]
		saye_vasat.modulate = AbColor.palette[6]
		saye_bala.modulate = AbColor.palette[6]
		saye_payin.modulate = AbColor.palette[6]
	
	sath.modulate.v -= 0
	saye_vasat.modulate.v -= .24
	saye_bala.modulate.v -= .24
	saye_payin.modulate.v -= .5


func paint_green() -> void:
	if AbColor.palette.size() > 7:
		sath.modulate = AbColor.palette[7]
		saye_vasat.modulate = AbColor.palette[7]
		saye_bala.modulate = AbColor.palette[7]
		saye_payin.modulate = AbColor.palette[7]
	
	sath.modulate.v -= 0
	saye_vasat.modulate.v -= .24
	saye_bala.modulate.v -= .24
	saye_payin.modulate.v -= .5
