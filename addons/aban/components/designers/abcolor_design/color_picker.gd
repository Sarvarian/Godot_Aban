extends HBoxContainer


var palette_index : int = 0

func _ready() -> void:
	$Text.text = String(palette_index)
	$Color.color = AbColor.palette[palette_index]


func _process(_delta : float) -> void:
	$Color.color = AbColor.palette[palette_index]


func _on_Color_color_changed(color : Color) -> void:
	AbColor.palette[palette_index] = color
