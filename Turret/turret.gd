extends Node3D

@export var projectile: PackedScene
@onready var turret_top: Node3D = $TurretBase/TurretTop/Cannon
@onready var turret_base: Node3D = $TurretBase
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var enemy_path: Path3D = null
var target: PathFollow3D = null
var turret_range: float = 10.0

func _physics_process(_delta: float) -> void:
	target = find_best_target()
	if target:
		turret_base.look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target:
		var new_projectile = projectile.instantiate()
		add_child(new_projectile)
		new_projectile.global_position = turret_top.global_position
		new_projectile.direction = turret_base.global_transform.basis.z
		animation_player.play("Fire")


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
