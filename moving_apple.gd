extends CharacterBody2D

var movespeed := 200.0

func _ready():
	velocity = Vector2(movespeed, 0)

func _physics_process(delta: float) -> void:
	velocity.x = movespeed
	move_and_slide()

	if is_on_wall():
		movespeed = -movespeed

	if movespeed > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
