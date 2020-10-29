class_name AbColorSettings
extends "res://addons/aban/settings/settings.gd"


export(Array, Color) var palette : Array = []


func _ready() -> void:
	AbColor.palette = palette


static func add_dancing(color : Color, time : float) -> void:
	AbColor.dancing.append([color, clamp(time, -1, 1)])
