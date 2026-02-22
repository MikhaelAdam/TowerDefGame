extends Control

var button_type = null

func _on_play_pressed() -> void:
<<<<<<< Updated upstream:scenes/mainMenu/main_menu.gd
	Dialogic.start("intro")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
=======
	Dialogic.start("scene1")
	get_tree().change_scene_to_file("res://scenes/UI/Menu/")
>>>>>>> Stashed changes:scenes/UI/Menu/main_menu.gd

func _on_option_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/Menu/")

func _on_exit_pressed() -> void:
	get_tree().quit()
