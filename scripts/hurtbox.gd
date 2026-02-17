extends Area2D
class_name Hurtbox

@export var enemy: Enemy

func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(hit_area: Hitbox) -> void:
	if hit_area != null and owner.has_method("take_damage"):
		owner.take_damage(hit_area.damage)
