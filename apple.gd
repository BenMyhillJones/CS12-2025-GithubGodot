extends Area2D

signal collected

@export var fall_speed := 150.0

func _physics_process(delta):
	position.y += fall_speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Basket":
		emit_signal("collected") # send scoring event
		queue_free()
