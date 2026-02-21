extends DefenderState

func enter(_previous_state_path: String, _data := {}) -> void:
	if defender.animation_player.has_animation("attack"):
		defender.animation_player.play("attack")
func physics_update(_delta: float) -> void:
	if not defender.has_see:
		finished.emit(IDLE)
	if defender.enemy_scaner:
		defender.attack()
	else:
		await defender.attack_timer.timeout
		finished.emit(IDLE)
