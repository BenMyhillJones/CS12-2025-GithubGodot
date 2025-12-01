extends CharacterBody2D

@export var speed := 600.0
@export var jump_force := 0
@export var gravity := 10000

@export var max_jumps := 10000   # 1 = normal jump, 2 = double jump
var jumps_left := 0

func _ready():
	jumps_left = max_jumps

func _physics_process(delta):
	# Apply gravity if not on floor
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.x = velocity.x + 1
	else:
		# Reset jumps when touching the ground
		jumps_left = max_jumps

	# Horizontal movement
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	velocity.x = direction * speed

	# Jump (allows double jump)
	if Input.is_action_just_pressed("Jump") and jumps_left > 0:
		velocity.y = jump_force
		jumps_left -= 1

	move_and_slide()
