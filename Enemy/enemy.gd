extends PathFollow3D

@export var max_health: int = 50
@export var speed: float
@export var gold_value := 15

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("Bank")
@onready var base = get_tree().get_first_node_in_group("base")

var current_health: int:
	set(health_in):
		if health_in < current_health:
			animation_player.play("TakeDamage")
		current_health = health_in
		if current_health < 1:
			bank.gold += gold_value
			queue_free()


func _ready():
	current_health = max_health

func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio >= 0.99:
		base.take_damage()
		set_process(false)
		queue_free()