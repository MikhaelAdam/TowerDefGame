extends EnemyState

func enter(_previous_state_path: String, _data := {}) -> void:
	enemy.queue_free()
