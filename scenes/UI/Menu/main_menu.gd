extends Control

var button_type = null

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/Menu/")

func _on_option_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/Menu/")

func _on_exit_pressed() -> void:
	get_tree().quit()
