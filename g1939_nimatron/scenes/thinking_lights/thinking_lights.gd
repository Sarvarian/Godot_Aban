extends Node2D


var animation : Animation = null
var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var timer : float = .0
var moves_left : int = 0


func _ready() -> void:
	rng.randomize()
	animation = $AnimationPlayer.get_animation("Thinking")


func _process(delta : float) -> void:
	if not animation.loop:
		return
	if timer <= .0:
		stop_thinking()
	timer -= delta


func start_thinking(heaps : PoolByteArray) -> void:
	moves_left = AbNim.moves_left(heaps)
	animation.loop = true
	$AnimationPlayer.play("Thinking")
	timer = rng.randf_range(moves_left-1, moves_left)


func stop_thinking() -> void:
	animation.loop = false


func is_thinking() -> bool:
	return $AnimationPlayer.is_playing()





