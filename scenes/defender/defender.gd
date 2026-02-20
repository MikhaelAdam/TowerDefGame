extends Area2D
class_name Defender


@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 
@onready var has_see: bool = false

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func take_damage(amount: int) -> void:
	hp_bar.value = max(0, hp_bar.value - amount)

func get_first_overlapping_body():
	var bodies = get_overlapping_bodies()
	if bodies.size() > 0:
		var first_body = bodies[0]
		return first_body
	else:
		return null # No bodies are overlapping

func _on_area_entered(area: EnemyScan) -> void:
	has_see = true

func _on_area_exited(area: EnemyScan) -> void:
	has_see = false
