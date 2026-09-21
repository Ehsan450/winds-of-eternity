extends Node2D

# UNVERIFIED — REQUIRES GODOT RUNTIME VALIDATION.
@onready var player: DemoPlayer = $Player
@onready var enemy: DemoEnemy = $BasicEnemy

func _ready() -> void:
	player.health_changed.connect(_update_player_hp)
	enemy.health_changed.connect(_update_enemy_hp)
	player.died.connect(_on_player_died)
	enemy.died.connect(_on_enemy_died)
	_update_player_hp(player.hp, player.max_hp)
	_update_enemy_hp(enemy.hp, enemy.max_hp)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart") and not event.is_echo():
		var error := get_tree().reload_current_scene()
		if error != OK:
			$HUD/Status.text = "Restart failed. Stop and run the scene again."

func _update_player_hp(current_hp: int, maximum_hp: int) -> void:
	$HUD/PlayerHP.text = "HERO  %d / %d HP" % [current_hp, maximum_hp]

func _update_enemy_hp(current_hp: int, maximum_hp: int) -> void:
	$HUD/EnemyHP.text = "BOG IMP  %d / %d HP" % [current_hp, maximum_hp]

func _on_player_died() -> void:
	$HUD/Status.text = "YOU FELL — Press R to restart"
	$HUD/Status.modulate = Color(1, 0.55, 0.45)

func _on_enemy_died() -> void:
	if not player.is_dead:
		$HUD/Status.text = "CREATURE DEFEATED — Press R for another round"
		$HUD/Status.modulate = Color(0.6, 1, 0.85)

func _draw() -> void:
	# Simple courtyard decoration only; physical walls are in CombatTest.tscn.
	draw_rect(Rect2(0, 0, 640, 360), Color("17252b"))
	draw_rect(Rect2(24, 64, 592, 272), Color("435452"))
	draw_rect(Rect2(28, 68, 584, 264), Color("728071"), false, 2.0)
	draw_rect(Rect2(40, 80, 560, 240), Color("293b3b"))
	for row in range(10):
		for column in range(20):
			var shade := 0.015 * float((row * 7 + column * 3) % 4)
			var stone := Color(0.19 + shade, 0.26 + shade, 0.25 + shade)
			draw_rect(Rect2(41 + column * 28, 81 + row * 24, 26, 22), stone)
	for corner in [Vector2(48, 88), Vector2(592, 88), Vector2(48, 312), Vector2(592, 312)]:
		draw_rect(Rect2(corner - Vector2(4, 4), Vector2(8, 8)), Color("78ae9b"))
