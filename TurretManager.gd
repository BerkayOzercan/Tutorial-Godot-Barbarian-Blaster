extends Node3D

@export var enemy_path: Path3D
@export var turret: PackedScene


func build_turret(turretPosition: Vector3) -> void:
	var new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = turretPosition
	new_turret.enemy_path = enemy_path
