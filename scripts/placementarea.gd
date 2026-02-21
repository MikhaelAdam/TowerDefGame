extends Area2D
class_name PlacementArea

@onready var allowed: bool = true
@onready var hover: bool = false
@onready var defender: Defender = null

func _ready() -> void:
	mouse_shape_entered.connect(_on_mouse_shape_entered)
	mouse_shape_exited.connect(_on_mouse_shape_exited)
	input_event.connect(_on_input_event)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hover:
		pass

func _on_input_event(_viewport: Node, _event:InputEvent, _shape_idx:int) -> void:
	if _event is InputEventMouseButton :
		if _event.button_index == MOUSE_BUTTON_LEFT and _event.pressed:
			if allowed and not defender:
				Singleton.add_defender(global_position)
				allowed = false
			else:
				pass

func _on_mouse_shape_entered(_shape_idx: int) -> void:
	hover = true
func _on_mouse_shape_exited(_shape_idx: int) -> void:
	hover = false
