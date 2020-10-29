extends Node


var palette : Array = []
var dancing : Array = []

func _process(_delta : float) -> void:
	for c in dancing:
		c[0].h += c[1]
		if c[0].h > 1:
			c[0].h = 0
		elif c[0].h < 0:
			c[0].h = 1
	pass



