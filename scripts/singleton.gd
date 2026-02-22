extends Node 

var current_stage: Stage : set = _set_stage, get = _get_stage
var health: int = 100 : set = _set_health, get = _get_health

const DEFENDER_POLICE = preload("uid://d3m1xymt61pi2")
const DEFENDER_BAD_GIRL = preload("uid://7cf2jsklxgau")
const DEFENDER_ALICE = preload("uid://cag1qy4k6ixe8")

const ENEMY_BASIC = preload("uid://b2hhnols2lwf4")

var defender_type: int = 2
var has_spawn: Dictionary[int , bool] = {
	0 : false,
	1 : false,
	2 : false,
	3 : false,
} 

func game_over() -> void:
	print("Game over")

func add_defender(pos: Vector2):
	var def: Defender
	match defender_type:
		0:
			def = DEFENDER_POLICE.instantiate()
		1:
			def = DEFENDER_BAD_GIRL.instantiate()
		2:
			def = DEFENDER_ALICE.instantiate()
	if def and has_spawn[defender_type] == false:
		def.global_position = pos
		current_stage.add_child(def)
		has_spawn[defender_type] = true
	else:
		pass
	
func _set_stage(stage: Stage) -> void:
	current_stage = stage
	
func _get_stage() -> Stage:
	return current_stage
func _set_health(amount: int) -> void:
	health = amount
func _get_health() -> int:
	return health
