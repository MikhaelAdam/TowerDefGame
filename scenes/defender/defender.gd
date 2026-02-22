extends Area2D
class_name Defender

@export var animation_player: AnimationPlayer
@export var attack_timer: Timer 
@export var many: bool = false
@export var damage: int = 20
@onready var has_see: bool = false
@onready var can_attack: bool = true
@onready var enemy_scaner: EnemyScan

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	attack_timer.timeout.connect(_on_attack_timer_timeout)
	animation_player.animation_finished.connect(_on_anim_finished)

func attack() -> void:
	if can_attack:
		if enemy_scaner.owner.has_method("take_damage"):
			if not many:
				enemy_scaner.owner.take_damage(damage)
			else:
				for area in get_overlapping_areas():
					area.owner.take_damage(damage)
		can_attack = false
		attack_timer.start()

func get_last_overlapping_area() -> void:
	var areas = get_overlapping_areas()
	enemy_scaner = areas[0] if areas else null
	has_see = true if areas else false
	
func _on_area_entered(_area: Area2D) -> void:
	get_last_overlapping_area()

func _on_area_exited(_area: Area2D) -> void:
	get_last_overlapping_area()

func _on_attack_timer_timeout() -> void:
	can_attack = true

func _on_anim_finished(anim_name: StringName) -> void:
	if anim_name == "attack" and has_see:
		animation_player.play("attack")
