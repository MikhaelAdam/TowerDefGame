extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.animation_player.play("die")
	await enemy.animation_player.animation_finished
	enemy.queue_free()
