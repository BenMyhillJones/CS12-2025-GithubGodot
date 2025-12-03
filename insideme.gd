extends CharacterBody2D
var tries = 3
var tries_label
func _ready():
	velocity = Vector2 (0, 200)
	tries_label = get_node("/root/Node2D/lives")
	
func _physics_process(delta: float) -> void:
	
	if position.y > 700:
		tries -= 1
		tries_label.text = "lives: " + str(tries)
		position.y = 0
		position.x = randi_range(10, 1100)
		
		if tries < 1:
			get_tree().change_scene_to_file("res://game_over_mmbwop.tscn")
	move_and_slide(); 



	


func _on_area_2d_body_entered(body: Node2D) -> void:
	position.y = 0
	position.x = randi_range(10, 1100)
