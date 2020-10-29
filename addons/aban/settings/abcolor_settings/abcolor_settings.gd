class_name AbColorSettings
extends "res://addons/aban/settings/settings.gd"


export(Array, Color) var palette : Array = []


func _ready() -> void:
	AbColor.palette = palette
