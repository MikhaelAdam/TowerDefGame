extends State
class_name EnemyState

const TRAVEL = "Travel"
const DIE = "Die"

var enemy : Enemy

func _ready() -> void:
	await owner.ready
	enemy = owner as Enemy
	assert(enemy != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
