class_name AbResetButton, "res://addons/aban/icons/reset_button.png"
extends Button


func _ready() -> void:
	connect("pressed", self, "pressed")


func pressed() -> void:
	get_tree().reload_current_scene()

