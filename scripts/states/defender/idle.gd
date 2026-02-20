extends DefenderState

func enter(previous_state_path: String, data := {}) -> void:
	defender.animation_player.play("idle")
	
func physics_update(_delta: float) -> void:
	if defender.has_see:
		finished.emit(ATTACK)
