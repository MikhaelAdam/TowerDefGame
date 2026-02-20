extends Area2D
class_name Defender

signal die

@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 

func take_damage(amount: int) -> void:
	hp_bar.value = max(0, hp_bar.value - amount)
	if hp_bar.value == 0:
		die.emit()


func get_first_overlapping_body():
	var bodies = get_overlapping_bodies()
	if bodies.size() > 0:
		var first_body = bodies[0]
		return first_body
	else:
		return null # No bodies are overlapping
