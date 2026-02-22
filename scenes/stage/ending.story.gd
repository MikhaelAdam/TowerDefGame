extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("ending")
	Dialogic.signal_event.connect(_on_dialogic_signal)


func _on_dialogic_signal(argument:String):
	get_tree().quit()
