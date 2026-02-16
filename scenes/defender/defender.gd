extends Area2D
class_name Defender

signal die

@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 
@export var hitbox: Hitbox

func take_damage(amount: int) -> void:
	hp_bar.value = max(0, hp_bar.value - amount)
	if hp_bar.value == 0:
		die.emit()
