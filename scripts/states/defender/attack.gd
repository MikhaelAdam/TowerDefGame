extends DefenderState

func enter(previous_state_path: String, data := {}) -> void:
	defender.animation_player.play("attack")
	
func physics_update(_delta: float) -> void:
	if not defender.has_see:
		await defender.animation_player.animation_finished
		finished.emit(IDLE)
	if defender.enemy_scaner:
		defender.enemy_scaner.owner.queue_free()
func exit() -> void:
	pass
