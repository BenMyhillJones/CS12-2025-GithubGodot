extends Node

@export var apple_scene: PackedScene
@export var spawn_area_width := 600
@export var spawn_y := -50

func _ready():
	spawn_apple()
	start_timer()

func start_timer():
	var timer := Timer.new()
	timer.wait_time = 1.5  # spawn every 1.5 seconds
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(spawn_apple)

func spawn_apple():
	var apple = apple_scene.instantiate()
	apple.position = Vector2(
		randf_range(0, spawn_area_width),
		spawn_y
	)
	get_tree().current_scene.add_child(apple)
