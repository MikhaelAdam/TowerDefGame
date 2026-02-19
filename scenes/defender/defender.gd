extends Area2D
class_name Defender

@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 
@export var hitbox: Hitbox

func destroy() -> void:
	queue_free()
