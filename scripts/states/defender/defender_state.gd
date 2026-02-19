extends State
class_name DefenderState

const IDLE = "Idle"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"

var defender: Defender

func _ready() -> void:
	await owner.ready
	defender = owner as Defender
	assert(defender != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
