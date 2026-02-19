extends Node2D

@export var enemy_basic: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get_tree().debug_collisions_hint = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var enemy := enemy_basic.instantiate()
	var enemy2 := enemy_basic.instantiate()
	$Path2D.add_child(enemy)
	$Path2D2.add_child(enemy2)
