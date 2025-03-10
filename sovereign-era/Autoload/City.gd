extends Node

class_name City

var city_name: String = "City"
var city_ID: int = 0
var city_population: int = 0
var city_owner: String = "Player"
var city_location: Vector2 = Vector2(0, 0)

var is_player_capital: bool = false

func _ready() -> void:
	# Runs when this node enters the scene tree
	# Add any node-specific initialization here, if needed
	pass

func _init():
	# Called upon creation (before entering the scene tree)
	# Put generic initialization logic here if desired
	pass

