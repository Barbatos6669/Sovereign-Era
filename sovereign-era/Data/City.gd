extends Node

class_name City

var city_name: String = "City"
var city_ID: int = 0
var city_population: int = 0
var city_owner: String = "Player"
var city_location: Vector2 = Vector2(0, 0)
var city_data: Dictionary = {}

var is_player_capital: bool = false

func _ready() -> void:
	# Runs when this node enters the scene tree
	# Add any node-specific initialization here, if needed
	pass

func _init():
	# Called upon creation (before entering the scene tree)
	# Put generic initialization logic here if desired
	pass

# -------------------
# Basic Setters
# -------------------

func set_city_name(new_name: String) -> void:
	city_name = new_name

func set_city_ID(new_ID: int) -> void:
	city_ID = new_ID

func set_city_population(new_population: int) -> void:
	city_population = new_population

func set_city_owner(new_owner: String) -> void:
	city_owner = new_owner

func set_city_location(new_location: Vector2) -> void:
	city_location = new_location

# -------------------
# Dictionary Operations
# -------------------

func set_city_data(new_data: Dictionary) -> void:
	city_data = new_data

func update_city_data(key: String, value: Variant) -> void:
	city_data[key] = value

func remove_city_data_key(key: String) -> void:
	city_data.erase(key)

func clear_city_data() -> void:
	city_data.clear()

# -------------------
# City Operations
# -------------------

func get_city_name() -> String:
	return city_name

func get_city_ID() -> int:
	return city_ID

func get_city_population() -> int:
	return city_population

func get_city_owner() -> String:
	return city_owner

func get_city_location() -> Vector2:
	return city_location

func get_city_data() -> Dictionary:
	return city_data
