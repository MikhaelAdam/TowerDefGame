extends Area2D
class_name Defender


@export var hp_bar: ProgressBar
@export var animation_player: AnimationPlayer
@export var timer: Timer 
@onready var has_see: bool = false
@onready var can_attack: bool = false
@onready var enemy_scaner: EnemyScan

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	timer.timeout.connect(_on_timer_timeout)


func _on_area_entered(area: EnemyScan) -> void:
	has_see = true
	enemy_scaner = area

func _on_area_exited(area: EnemyScan) -> void:
	has_see = false
	enemy_scaner = null

func _on_timer_timeout() -> void:
	print("can_attack = true")
