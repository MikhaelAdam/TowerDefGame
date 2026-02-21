extends Node2D
class_name Stage

@export var paths: Array[Path2D]
@export var harvester: Array[Harvester]
@export var max_defenders: int = 4

var level: int 
var defenders: Array[Defender]
var path_timers: Array[Timer] = []

func _ready() -> void:
	Singleton.current_stage = self
	if harvester:
		for h in harvester:
			h.game_over.connect(_on_game_over)
	if paths:
		for path in paths:
			var timer := Timer.new()
			timer.wait_time = 2.0   # spawn interval (seconds)
			timer.one_shot = false  # repeat
			timer.autostart = true
			
			timer.timeout.connect(_on_path_timer_timeout.bind(path))
			
			add_child(timer)
			path_timers.append(timer)

func spawn_emeny(path: Path2D) -> void:
	var enemy := Singleton.ENEMY_BASIC.instantiate()
	path.add_child(enemy)

func _on_game_over() -> void:
	Singleton.game_over()

func _on_path_timer_timeout(path: Path2D) -> void:
	spawn_emeny(path)
