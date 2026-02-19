extends PathFollow2D
class_name Enemy

signal die

@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 

const SPEED: float = .05

# Enemy Movement
func _physics_process(delta: float) -> void:
	hp_bar.visible = false
	if get_parent() is Path2D:
		progress_ratio = move_toward(progress_ratio, 1.0, delta * SPEED)
	if progress_ratio == 1:
		destroy()

# Recive Damage
func take_damage(amount: int) -> void:
	hp_bar.value = max(0, hp_bar.value - amount)
	hp_bar.visible = true 

# Remove enemy from scene
func destroy() -> void:
	queue_free()
	die.emit()
