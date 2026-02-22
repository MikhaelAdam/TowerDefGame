extends Node 

var current_stage: Stage 
var health: int = 100

const DEFENDER_POLICE = preload("uid://d3m1xymt61pi2")

const ENEMY_BASIC = preload("uid://b2hhnols2lwf4")

var defender_type: int = 0

func game_over() -> void:
	print("Game over")

func add_defender(pos: Vector2):
	var def: Defender
	match defender_type:
		0:
			def = DEFENDER_POLICE.instantiate()
		
	def.global_position = pos
	current_stage.add_child(def)
