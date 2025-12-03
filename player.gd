extends CharacterBody2D

@export var speed := 600.0
@export var gravity := 10000
var score = 0
var score_label
func _ready():
	score_label = get_node("/root/Node2D/scorelabel")

func _physics_process(delta):
	# Horizontal movement
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	velocity.x = direction * speed


	

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	score += 1
	score_label.text = "score " + str(score)
