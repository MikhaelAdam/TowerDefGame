extends PathFollow2D
class_name Enemy

@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 

const SPEED: float = .05
	
func take_damage(amount: int) -> void:
	hp_bar.value = max(0, hp_bar.value - amount)
#	hp_bar.visible = true 
	if hp_bar.value == 0:
		queue_free()
