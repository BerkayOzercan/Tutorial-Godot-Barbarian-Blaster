extends Node3D

@export var label: Label3D

var max_health = 5

func _ready() -> void:
	set_label(max_health)

func take_damage() -> void:
	max_health -= 1
	set_label(max_health)
	pass

func set_label(txt) -> void:
	label.text = str(txt)