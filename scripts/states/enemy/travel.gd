extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.animation_player.play("travel")
	
func physics_update(_delta: float) -> void:
#	enemy.hp_bar.visible = false
	if enemy.get_parent() is Path2D:
		enemy.progress_ratio = move_toward(enemy.progress_ratio, 1.0, _delta * enemy.SPEED)
	if enemy.progress_ratio == 1 or enemy.hp_bar.value == 0:
		finished.emit(DIE)
