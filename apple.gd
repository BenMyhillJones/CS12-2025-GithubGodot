extends Area2D

signal collected
signal missed

@export var fall_speed := 150.0

func _physics_process(delta):
	position.y += fall_speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Basket":
		emit_signal("collected")
		queue_free()
	elif body.name == "Ground":
		emit_signal("missed")
		queue_free()
