extends EnemyState

func enter(_previous_state_path: String, _data := {}) -> void:
	enemy.animation_player.play("travel")
	
func physics_update(_delta: float) -> void:
	if enemy.get_parent() is Path2D:
		enemy.progress_ratio = move_toward(enemy.progress_ratio, 1.0, _delta * enemy.SPEED)
	if enemy.progress_ratio == 1 or enemy.hp_bar.value == 0:
		finished.emit(DIE)
