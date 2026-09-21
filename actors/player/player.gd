extends CharacterBody2D

# UNVERIFIED — REQUIRES GODOT RUNTIME VALIDATION.
@export var movement_speed: float = 120.0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * movement_speed
	move_and_slide()
