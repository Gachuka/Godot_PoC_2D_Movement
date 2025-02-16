extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animations: AnimationPlayer = $AnimationPlayer

const SPEED: float = 50.0
const RUNNING_MULT: float = 1.5

var movement_direction: Vector2 = Vector2.ZERO
var isRunning: bool = false

func _physics_process(delta: float) -> void:
	movement_direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	isRunning = Input.is_physical_key_pressed(KEY_SHIFT)
	if movement_direction.length() > 0:
		movement_direction = movement_direction.normalized()
	move(delta)

func move(delta: float) -> void:
	if movement_direction != Vector2.ZERO:
		velocity = movement_direction * SPEED * (RUNNING_MULT if isRunning else 1)
		if movement_direction.x > 0:
			animated_sprite.flip_h = false
			animations.play("run" if isRunning else "walk")
		elif movement_direction.x < 0:
			animated_sprite.flip_h = true
			animations.play("run" if isRunning else "walk")
		elif movement_direction.y > 0:
			animations.play("run_down" if isRunning else "walk_down")
		elif movement_direction.y < 0:
			animations.play("run_up" if isRunning else "walk_up")
	else:
		velocity = Vector2.ZERO
		animations.play("idle")
	move_and_slide()
