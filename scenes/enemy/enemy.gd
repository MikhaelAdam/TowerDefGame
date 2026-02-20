extends PathFollow2D
class_name Enemy

signal die

@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 

const SPEED: float = .02
	
func take_damage(amount: int) -> void:
	hp_bar.value = max(0, hp_bar.value - amount)
	if hp_bar.value == 0:
		die.emit()
	hp_bar.visible = true 

func destroy() -> void:
	queue_free()
