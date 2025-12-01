extends CharacterBody2D

@export var speed := 600.0
@export var acceleration := 3000.0
@export var friction := 800.0  # lower friction = more slippery
@export var jump_force := 0
@export var gravity := 10000

@export var max_jumps := 2
var jumps_left := 0

func _ready():
	jumps_left = max_jumps

func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jumps_left = max_jumps

	# INPUT
	var direction := Input.get_axis("MoveLeft", "MoveRight")

	# Horizontal acceleration (ice physics)
	if direction != 0:
		# accelerate toward input direction
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		# no input → apply friction but not instant stop
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	# Jumping
	if Input.is_action_just_pressed("Jump") and jumps_left > 0:
		velocity.y = jump_force
		jumps_left -= 1

	move_and_slide()
