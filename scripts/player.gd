extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animations: AnimationPlayer = $AnimationPlayer

const SPEED: float = 100.0

var movement_direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	movement_direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if movement_direction.length() > 0:
		movement_direction = movement_direction.normalized()
	move(delta)

func move(delta: float) -> void:
	if movement_direction != Vector2.ZERO:
		velocity = movement_direction * SPEED
		if movement_direction.x > 0:
			animated_sprite.flip_h = false
			animations.play("walk")
		elif movement_direction.x < 0:
			animated_sprite.flip_h = true
			animations.play("walk")
		elif movement_direction.y > 0:
			animations.play("walk_down")
		elif movement_direction.y < 0:
			animations.play("walk_up")
	else:
		velocity = Vector2.ZERO
		animations.play("idle")
	move_and_slide()
