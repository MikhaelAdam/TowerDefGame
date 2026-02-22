extends Node2D
class_name Stage

@export var paths: Array[Path2D]
@export var harvester: Array[Harvester]
@export var max_enemies: int 
@export var battle_ui: BattleUI
@export var next_level: String
@export var time_spawn: float
@export var level: int  

var defenders: Array[Defender]
var path_timers: Array[Timer] = []

func _ready() -> void:
	Singleton.current_stage = self
	match level:
		1:
			battle_ui.lisa.show()
		2:
			battle_ui.lisa.show()
			battle_ui.steve.show()
		3:
			battle_ui.lisa.show()
			battle_ui.alice.show()
			battle_ui.maria.show()
			battle_ui.steve.show()
		4:
			battle_ui.lisa.show()
			battle_ui.alice.show()
			battle_ui.maria.show()
			battle_ui.steve.show()
		5:
			battle_ui.lisa.show()
			battle_ui.alice.show()
			battle_ui.maria.show()
			battle_ui.steve.show()
	battle_ui.label.text = "Enemies Left :" + str(max_enemies)
	if harvester:
		for h in harvester:
			h.game_over.connect(_on_game_over)
	if paths:
		for path in paths:
			var timer := Timer.new()
			timer.wait_time = time_spawn   # spawn interval (seconds)
			timer.one_shot = false  # repeat
			timer.autostart = true
			
			timer.timeout.connect(_on_path_timer_timeout.bind(path))
			
			add_child(timer)
			path_timers.append(timer)
			
func spawn_emeny(path: Path2D) -> void:
	if max_enemies > 0:
		var enemy := Singleton.ENEMY_BASIC.instantiate()
		path.add_child(enemy)
		max_enemies -= 1
		battle_ui.label.text = "Enemies Left :" + str(max_enemies)
	else:
		for pt in paths:
			if pt.get_child_count() == 0:
				get_tree().change_scene_to_file(next_level)
func _on_game_over() -> void:
	Singleton.game_over()

func _on_path_timer_timeout(path: Path2D) -> void:
	spawn_emeny(path)
