extends Node2D


export(PackedScene) var token_scene : PackedScene = null

var lines : Array = []
var line_that_turns_off : Node2D = null
var can_go_next_turn : bool = false
var cpu_move : PoolByteArray = []


func _ready() -> void:
	$TokenGiver.add_child(token_scene.instance())
	for c in get_children():
		if c.has_method("turn_a_light_off"):
			lines.append(c)
	
	for l in lines:
		l.connect("a_light_turns_off", self, "a_light_turns_off")
		l.connect("we_got_reset", self, "a_line_got_reset")
# warning-ignore:return_value_discarded
	$ThinkingLights.get_child(0).connect("animation_finished", self, "thinking_finished")


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
	$CommitButton.play("Red")

func go_green() -> void:
	$CommitButton.play("Green")


func cpu_turn() -> void:
	var heaps : PoolByteArray = []
	for l in lines:
		heaps.append(l.how_many_are_on())
	cpu_move = AbNim.play(heaps)
	$ThinkingLights.start_thinking(heaps)


func thinking_finished(_anim_name : String) -> void:
	$LightOffer.start_offing(lines[cpu_move[0]], cpu_move[1])


func cpu_done() -> void:
	cpu_move.resize(0)
	
	unlock()
	
	for l in lines:
		if l.how_many_are_on() > 0:
			return
	$TokenGiver.add_child(token_scene.instance())


func lock() -> void:
	for l in lines:
		l.lock()


func unlock() -> void:
	for l in lines:
		l.unlock()





