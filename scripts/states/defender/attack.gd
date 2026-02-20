extends DefenderState

func enter(previous_state_path: String, data := {}) -> void:
	defender.animation_player.play("attack")

func physics_update(_delta: float) -> void:
	if not defender.has_see:
		finished.emit(IDLE)
