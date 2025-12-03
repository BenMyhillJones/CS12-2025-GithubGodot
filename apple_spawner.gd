extends Node

@export var apple_scene: PackedScene
@export var spawn_area_width := 600
@export var spawn_y := -50

var score := 0
@onready var score_label = $"../CanvasLayer/ScoreLabel"  # adjust path if needed

func _ready():
	spawn_apple()
	start_timer()
	update_score()

func start_timer():
	var timer := Timer.new()
	timer.wait_time = 1.5
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

	# Add to the scene
	get_tree().current_scene.add_child(apple)

	# Connect the apple's "collected" signal
	apple.collected.connect(_on_apple_collected)

func _on_apple_collected():
	score += 1
	update_score()

func update_score():
	score_label.text = "Score: %d" % score
