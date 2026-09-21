class_name DemoEnemy
extends CharacterBody2D

# UNVERIFIED — REQUIRES GODOT RUNTIME VALIDATION.
signal health_changed(current_hp: int, maximum_hp: int)
signal died

@export var max_hp: int = 60
@export var movement_speed: float = 65.0
@export var detection_range: float = 420.0
@export var attack_range: float = 25.0
@export var attack_damage: int = 20
@export var attack_cooldown: float = 0.9
@export var attack_knockback: float = 170.0
@export var hurt_duration: float = 0.18
@export var knockback_deceleration: float = 1000.0
@export var death_fade_duration: float = 0.28

var hp: int
var is_dead: bool = false
var cooldown_remaining: float = 0.0
var hurt_remaining: float = 0.0
var knockback_velocity: Vector2 = Vector2.ZERO

@onready var target: DemoPlayer = get_tree().get_first_node_in_group("player") as DemoPlayer
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	hp = max_hp
	health_changed.emit(hp, max_hp)

func _physics_process(delta: float) -> void:
	if is_dead:
		return
	cooldown_remaining = maxf(0.0, cooldown_remaining - delta)
	hurt_remaining = maxf(0.0, hurt_remaining - delta)
	velocity = knockback_velocity
	if is_instance_valid(target) and not target.is_dead and hurt_remaining <= 0.0:
		var to_player := target.global_position - global_position
		var distance := to_player.length()
		if distance <= detection_range:
			if distance > attack_range:
				velocity += to_player.normalized() * movement_speed
			elif cooldown_remaining <= 0.0:
				cooldown_remaining = attack_cooldown
				var push_direction := to_player.normalized() if distance > 0.0 else Vector2.DOWN
				target.take_damage(attack_damage, push_direction * attack_knockback)
	move_and_slide()
	knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, knockback_deceleration * delta)
	sprite.modulate = Color(4, 4, 4) if hurt_remaining > 0.0 else Color.WHITE

func take_damage(amount: int, push: Vector2) -> void:
	if is_dead:
		return
	hp = maxi(0, hp - amount)
	hurt_remaining = hurt_duration
	knockback_velocity = push
	sprite.modulate = Color(4, 4, 4)
	health_changed.emit(hp, max_hp)
	if hp == 0:
		is_dead = true
		velocity = Vector2.ZERO
		$CollisionShape2D.set_deferred("disabled", true)
		died.emit()
		var fade := create_tween()
		fade.tween_property(sprite, "modulate:a", 0.0, death_fade_duration)
		fade.tween_callback(queue_free)
