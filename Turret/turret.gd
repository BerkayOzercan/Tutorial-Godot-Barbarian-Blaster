extends Node3D

@export var projectile: PackedScene
@onready var turret_top: MeshInstance3D = $TurretTop
var enemy_path: Path3D

func _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	var new_projectile = projectile.instantiate()
	add_child(new_projectile)
	new_projectile.global_position = turret_top.global_position
	new_projectile.direction = global_transform.basis.z
