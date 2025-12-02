extends Area2D

@export var fall_speed := 150.0

func _physics_process(delta):
	position.y += fall_speed * delta

#func _on_apple_body_entered(body):
	


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Basket":
		queue_free()
