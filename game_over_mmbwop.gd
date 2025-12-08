extends Control



func _on_button_button_down() -> void:
	Globals.tries = 3
	get_tree().change_scene_to_file("res://appleDropper.tscn")
