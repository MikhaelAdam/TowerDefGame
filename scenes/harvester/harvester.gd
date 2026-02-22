extends Area2D
class_name Harvester

signal game_over

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func take_damage(amount: int) -> void:
	Singleton.health = max(0, Singleton.health - amount)
	if Singleton.health == 0:
		game_over.emit()


func _on_area_entered(area: EnemyScan) -> void:
	print(Singleton.health)
	take_damage(area.owner.damage)
