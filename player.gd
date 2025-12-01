extends CharacterBody2D

@export var speed := 600.0
@export var acceleration := 3000.0
@export var friction := 800.0  # lower friction = more slippery




	

func _physics_process(delta):
	

	
	var direction := Input.get_axis("MoveLeft", "MoveRight")

	
	if direction != 0:
		
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
		
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	
	

	move_and_slide()
