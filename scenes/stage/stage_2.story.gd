extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("scene2")
	Dialogic.signal_event.connect(_on_dialogic_signal)


func _on_dialogic_signal(argument:String):
	if argument == "done":
		get_tree().change_scene_to_file("res://scenes/stage/stage_2.tscn")
