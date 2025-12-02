extends CharacterBody2D



func _ready():
	velocity = Vector2(200, 0)

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	if is_on_wall():
		velocity = -velocity
