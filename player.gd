extends CharacterBody2D

@export var speed := 700.0
@export var acceleration := 3000.0
@export var friction := 650.0         # lower = more slippery
@export var bounce_factor := 0.9      # 1.0 = perfect bounce, <1.0 loses speed
@export var jump_force := -1200.0     # negative for upward jump
@export var gravity := 10000.0
var score_label
var score = 0
@export var max_jumps := 2
var jumps_left := 0

func _ready():
	score_label = get_node("/root/Node2D/scorelabel")

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jumps_left = max_jumps

	# Read movement input
	var direction := Input.get_axis("MoveLeft", "MoveRight")

	# Ice-like horizontal movement
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	# Jumping
	if Input.is_action_just_pressed("Jump") and jumps_left > 0:
		velocity.y = jump_force
		jumps_left -= 1

	# Move and bounce logic
	var previous_velocity := velocity
	move_and_slide()

	# Bounce off walls
	if is_on_wall():
		velocity.x = -previous_velocity.x * bounce_factor


# score thing 
func _on_area_2d_body_entered(body: Node2D) -> void:
	score += 1
	score_label.text = "score " + str(score)
