extends Control
class_name BattleUI
@onready var label: Label = $Label
@onready var steve: Button = $MarginContainer/MarginContainer/HBoxContainer/Steve
@onready var maria: Button = $MarginContainer/MarginContainer/HBoxContainer/Maria
@onready var alice: Button = $MarginContainer/MarginContainer/HBoxContainer/Alice
@onready var lisa: Button = $MarginContainer/MarginContainer/HBoxContainer/Lisa


func _on_lisa_pressed() -> void:
	Singleton.defender_type = 3


func _on_steve_pressed() -> void:
	Singleton.defender_type = 0


func _on_maria_pressed() -> void:
	Singleton.defender_type = 1


func _on_alice_pressed() -> void:
	Singleton.defender_type = 2
