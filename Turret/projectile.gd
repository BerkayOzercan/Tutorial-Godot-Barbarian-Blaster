extends Area3D

var dirction := Vector3.FORWARD

@export var speed: float = 30.0

func _physics_process(delta: float) -> void:
	position += dirction * delta * speed