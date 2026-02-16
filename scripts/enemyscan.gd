extends Node
class_name EnemyScan

signal see_another(coll_body: Area2D)

@export var coll: Area2D

func _ready() -> void:
	coll.area_entered.connect(_on_see)

func _process(delta: float) -> void:
	pass
		
func _on_see(area: Defender) -> void:
	see_another.emit(area)
