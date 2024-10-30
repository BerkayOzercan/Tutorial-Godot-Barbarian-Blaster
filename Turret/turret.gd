extends Node3D

@export var projectile: PackedScene
@onready var turret_top: MeshInstance3D = $TurretTop

var enemy_path: Path3D
var target: PathFollow3D
var turret_range: float = 10.0

func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target:
		look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target:
		var new_projectile = projectile.instantiate()
		add_child(new_projectile)
		new_projectile.global_position = turret_top.global_position
		new_projectile.direction = global_transform.basis.z


func  find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress = 0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			var distance = global_position.distance_to(enemy.global_position)
			if enemy.progress > best_progress && distance < turret_range:
				best_target = enemy
				best_progress = enemy.progress
	return best_target