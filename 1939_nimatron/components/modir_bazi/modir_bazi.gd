extends Node2D


#export(PackedScene) var token_scene : PackedScene = null

var lines : Array = []
var line_that_turns_off : Node2D = null
var can_go_next_turn : bool = false
var cpu_move : PoolByteArray = []

onready var sabt : TouchScreenButton = get_node("../Sabt")
onready var thinking_lights : Node2D = get_node("../ThinkingLights")
onready var light_offer : Timer = get_node("../LightOffer")


func _ready() -> void:
#	$TokenGiver.add_child(token_scene.instance())
	for c in get_children():
		if c.has_method("turn_a_light_off"):
			lines.append(c)
	
	for l in lines:
		l.connect("lamp_khamoosh", self, "a_light_turns_off")
		l.connect("khat_bazgasht", self, "a_line_got_reset")
# warning-ignore:return_value_discarded
	thinking_lights.get_child(0).connect("animation_finished", self, "thinking_finished")
# warning-ignore:return_value_discarded
	light_offer.connect("cpu_done", self, "cpu_done")


func a_light_turns_off(line : Node2D) -> void:
	if line != line_that_turns_off:
		if line_that_turns_off:
			line_that_turns_off.reset_lights()
		line_that_turns_off = line
	
	if not cpu_move:
		can_go_next_turn = true
		go_green()


func a_line_got_reset() -> void:
	can_go_next_turn = false
	go_red()


func go_next_turn() -> void:
	if can_go_next_turn:
		line_that_turns_off.submit_changes()
		can_go_next_turn = false
		go_red()
		cpu_turn()
		lock()


func go_red() -> void:
	sabt.red()

func go_green() -> void:
	sabt.green()


func cpu_turn() -> void:
	var heaps : PoolByteArray = []
	for l in lines:
		heaps.append(l.how_many_are_on())
	cpu_move = AbNim.play(heaps)
	thinking_lights.start_thinking(heaps)


func thinking_finished(_anim_name : String) -> void:
	light_offer.start_offing(lines[cpu_move[0]], cpu_move[1])


func cpu_done() -> void:
	cpu_move.resize(0)
	
	unlock()
	
	for l in lines:
		if l.how_many_are_on() > 0:
			return
#	$TokenGiver.add_child(token_scene.instance())


func lock() -> void:
	for l in lines:
		l.lock()


func unlock() -> void:
	for l in lines:
		l.unlock()





