extends Area2D
class_name Defender


@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer 
@onready var has_see: bool = false
@onready var enemy_scaner: EnemyScan

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func take_damage(amount: int) -> void:
	hp_bar.value = max(0, hp_bar.value - amount)

func _on_area_entered(area: EnemyScan) -> void:
	has_see = true
	enemy_scaner = area

func _on_area_exited(area: EnemyScan) -> void:
	has_see = false
	enemy_scaner = null
