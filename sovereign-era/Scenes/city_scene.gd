extends Node

## City Scene Script
## This script is attached to the CityScene node in the city_scene.tscn scene.
## It is responsible for updating the city information displayed in the scene.

func _ready() -> void:
	# Add top bar to the scene
	var top_bar: PackedScene = preload("res://UI/top_bar.tscn")
	get_tree().get_root().add_child(top_bar.instantiate())
	

func _process(_delta: float) -> void:
	pass




 
