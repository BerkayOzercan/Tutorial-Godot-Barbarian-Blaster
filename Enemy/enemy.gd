extends PathFollow3D

@export var max_health: int = 50
@export var speed: float

var current_health: int:
	set(health_in):
		current_health = health_in
		if current_health < 1:
			queue_free()

@onready var base = get_tree().get_first_node_in_group("base")

func _ready():
	current_health = max_health

func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio >= 0.99:
		base.take_damage()
		set_process(false)