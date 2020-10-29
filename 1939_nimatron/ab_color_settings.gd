extends AbColorSettings


func _ready() -> void:
	add_dancing(Color.yellow, 0)
	add_dancing(Color.red, .01)
	add_dancing(Color.red, -.01)
	add_dancing(Color.red, .005)
	add_dancing(Color.red, -.005)
	pass

