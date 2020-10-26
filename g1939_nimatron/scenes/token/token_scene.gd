extends Node2D


var is_clicked : bool = false


func _process(_delta : float) -> void:
#	$Light.position.x += Input.get_accelerometer.x
#	$Light.position.y += Input.get_accelerometer.y
	$Light.position.x = Input.get_gyroscope().x + 64
	$Light.position.y = Input.get_gyroscope().y + 96
	$Light.position = get_global_mouse_position()
	
	$Light.position.x = clamp($Light.position.x, 0, 128)
	$Light.position.y = clamp($Light.position.y, 0, 192)


func _on_TokenButton_pressed():
	$Token.z_index = 1
	$Token.mode = RigidBody2D.MODE_STATIC
	$AnimationPlayer.play("Clicked")
	pass

