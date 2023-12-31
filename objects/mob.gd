extends CharacterBody2D

const SPEED = 20.0
var direction = Vector2.ZERO

var hp = 6
var damage = 4

func _physics_process(delta):
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func hit(damage):
	hp -= damage

func is_dead():
	return hp <= 0

func _on_timer_timeout():
	direction = Vector2(randf_range(-10, 10), randf_range(-2, 2))
