extends CharacterBody2D

func _ready():
	velocity = Vector2 (0, 200)
	Globals.tries_label = get_node("/root/Node2D/lives")
	
func _physics_process(delta: float) -> void:
	
	if position.y > 700:
		Globals.tries -= 1
		Globals.tries_label.text = "lives: " + str(Globals.tries)
		position.y = 0
		position.x = randi_range(10, 1100)
		
	move_and_slide(); 


# this is where the stupid little apple respawns when it goes into the stupid little basket
func _on_area_2d_body_entered(body: Node2D) -> void:
	
	$"../AudioStreamPlayer".play()
	
	position.y = 0
	position.x = randi_range(10, 1100)
	Globals.applevalue = randi_range(0, 100)
