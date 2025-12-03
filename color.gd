extends ColorRect
var colorspeen = 0
var colorwheel

func _ready():
	pass #dunno what to do for now
	
func _process(_delta: float) -> void:
	while true:
		colorspeen += 1
		colorwheel = Color.from_hsv(colorspeen, 75, 100)
