extends PathFollow2D
class_name Enemy

signal die

@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 
@export var hitbox: Hitbox

const SPEED: float = .05

func _physics_process(delta: float) -> void:
	hp_bar.visible = false if hp_bar.value == 100 else true
	if get_parent() is Path2D:
		progress_ratio = move_toward(progress_ratio, 1.0, delta * SPEED)
	if progress_ratio == 1:
		destroy()
	
func take_damage(amount: int) -> void:
	hp_bar.value = max(0, hp_bar.value - amount)
	if hp_bar.value == 0:
		die.emit()

func destroy() -> void:
	queue_free()
