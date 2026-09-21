class_name DemoPlayer
extends CharacterBody2D

# UNVERIFIED — REQUIRES GODOT RUNTIME VALIDATION.
signal health_changed(current_hp: int, maximum_hp: int)
signal died

@export var movement_speed: float = 120.0
@export var max_hp: int = 100
@export var attack_damage: int = 20
@export var attack_cooldown: float = 0.4
@export var attack_duration: float = 0.16
@export var attack_reach: float = 24.0
@export var attack_size: Vector2 = Vector2(28, 32)
@export var attack_knockback: float = 210.0
@export var invulnerability_duration: float = 0.8
@export var hurt_duration: float = 0.16
@export var knockback_deceleration: float = 850.0

var hp: int
var is_dead: bool = false
var facing: Vector2 = Vector2.DOWN
var cooldown_remaining: float = 0.0
var swing_remaining: float = 0.0
var invulnerability_remaining: float = 0.0
var hurt_remaining: float = 0.0
var knockback_velocity: Vector2 = Vector2.ZERO
var hit_ids: Array[int] = []
var attack_shape: RectangleShape2D = RectangleShape2D.new()

@onready var sprite: Sprite2D = $Sprite2D
@onready var attack: Node2D = $Attack
@onready var slash: Sprite2D = $Attack/WindSlash

func _ready() -> void:
	hp = max_hp
	attack_shape.size = attack_size
	attack.hide()
	health_changed.emit(hp, max_hp)

func _physics_process(delta: float) -> void:
	if is_dead:
		return
	cooldown_remaining = maxf(0.0, cooldown_remaining - delta)
	invulnerability_remaining = maxf(0.0, invulnerability_remaining - delta)
	hurt_remaining = maxf(0.0, hurt_remaining - delta)
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO and swing_remaining <= 0.0 and hurt_remaining <= 0.0:
		_update_facing(direction)
	if Input.is_action_just_pressed("attack") and cooldown_remaining <= 0.0 and hurt_remaining <= 0.0:
		_start_attack()
	velocity = knockback_velocity if hurt_remaining > 0.0 else direction * movement_speed + knockback_velocity
	move_and_slide()
	knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, knockback_deceleration * delta)
	if swing_remaining > 0.0:
		_check_attack_hits()
		swing_remaining = maxf(0.0, swing_remaining - delta)
		slash.modulate.a = swing_remaining / attack_duration
		attack.visible = swing_remaining > 0.0
	sprite.modulate = Color(3, 3, 3) if hurt_remaining > 0.0 else Color.WHITE
	if invulnerability_remaining > 0.0:
		sprite.modulate.a = 0.45 if int(invulnerability_remaining * 16.0) % 2 == 0 else 1.0

func _update_facing(direction: Vector2) -> void:
	if absf(direction.x) > absf(direction.y):
		facing = Vector2.RIGHT if direction.x > 0.0 else Vector2.LEFT
		sprite.frame = 1 if direction.x > 0.0 else 3
	else:
		facing = Vector2.DOWN if direction.y > 0.0 else Vector2.UP
		sprite.frame = 0 if direction.y > 0.0 else 2

func _start_attack() -> void:
	cooldown_remaining = attack_cooldown
	swing_remaining = attack_duration
	hit_ids.clear()
	attack.position = facing * attack_reach
	attack.rotation = facing.angle()
	slash.modulate = Color.WHITE
	attack.show()

func _check_attack_hits() -> void:
	# Query only while swinging; no cached Area2D overlaps from a previous facing.
	var query := PhysicsShapeQueryParameters2D.new()
	query.shape = attack_shape
	query.transform = attack.global_transform
	query.collision_mask = 4 # Enemy layer only.
	for hit in get_world_2d().direct_space_state.intersect_shape(query):
		var enemy := hit["collider"] as Node2D
		if enemy != null and enemy.has_method("take_damage") and not hit_ids.has(enemy.get_instance_id()):
			hit_ids.append(enemy.get_instance_id())
			enemy.call("take_damage", attack_damage, facing * attack_knockback)

func take_damage(amount: int, push: Vector2) -> void:
	if is_dead or invulnerability_remaining > 0.0:
		return
	hp = maxi(0, hp - amount)
	invulnerability_remaining = invulnerability_duration
	hurt_remaining = hurt_duration
	knockback_velocity = push
	swing_remaining = 0.0
	attack.hide()
	health_changed.emit(hp, max_hp)
	if hp == 0:
		is_dead = true
		velocity = Vector2.ZERO
		sprite.rotation = PI / 2.0
		sprite.modulate = Color(0.5, 0.55, 0.6)
		$CollisionShape2D.set_deferred("disabled", true)
		died.emit()
