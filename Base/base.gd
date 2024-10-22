extends Node3D

@export var label: Label3D

var max_health = 5

var current_health: int:
	set(health_in):
		current_health = health_in
		print("health was changed")
		label.text = str(current_health) + "/" + str(max_health)

		var red: Color = Color.RED
		var white: Color = Color.WHITE
		label.modulate = red.lerp(white, float(current_health) / float(max_health))
		
		if current_health < 1:
			get_tree().reload_current_scene()

func _ready() -> void:
	current_health = max_health
	pass

func take_damage() -> void:
	current_health -= 1
	pass