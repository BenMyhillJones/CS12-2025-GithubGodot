extends Node


@export var spawn_area_width := 600
@export var spawn_y := -50

var score := 0
@onready var score_label = $"../CanvasLayer/ScoreLabel"  # adjust if needed

func _ready():
	#spawn_apple()
	start_timer()
	update_score()

func start_timer():
	var timer := Timer.new()
	timer.wait_time = 1.5  # spawn every 1.5 seconds
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)

	##apple.missed.connect(_on_apple_missed)

func _on_apple_collected():
	score += 1
	update_score()

func _on_apple_missed():
	score -= 5
	update_score()

func update_score():
	score_label.text = "Score: %d" % score
