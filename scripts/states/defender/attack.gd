extends DefenderState

func enter(previous_state_path: String, data := {}) -> void:
	defender.animation_player.play("attack")
	
func physics_update(_delta: float) -> void:
	if not defender.has_see:
		await defender.animation_player.animation_finished
	if defender.enemy_scaner:
		defender.enemy_scaner.owner.take_damage(50)
	else:
		finished.emit(IDLE)
