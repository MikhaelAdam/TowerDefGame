extends PathFollow2D
class_name Enemy

signal die

@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 

const SPEED: float = .05

func _physics_process(delta: float) -> void:
	hp_bar.visible = false
	if get_parent() is Path2D:
		progress_ratio = move_toward(progress_ratio, 1.0, delta * SPEED)
	if progress_ratio == 1:
		destroy()

func take_damage(amount: int) -> void:
	hp_bar.value = max(0, hp_bar.value - amount)
	if hp_bar.value == 0:
		die.emit()
	hp_bar.visible = true 

func destroy() -> void:
	queue_free()
