extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_ui()

func set_profile(data: Dictionary) -> void:
	print("Setting Profile Data: ", data)
	
func update_ui() -> void:
	print("Updating UI")
	
