extends Node3D

@export var projectile: PackedScene
@onready var turret_top: MeshInstance3D = $TurretTop

func _on_timer_timeout() -> void:
	var new_projectile = projectile.instantiate()
	add_child(new_projectile)
	new_projectile.global_position = turret_top.global_position
