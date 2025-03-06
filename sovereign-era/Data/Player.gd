extends Node
class_name Player

var player_name: String = "Player"
var player_password: String = "password" # In production, use a hashed password!
var player_email: String = ""
var player_data: Dictionary = {}

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

func set_player_name(new_name: String) -> void:
	player_name = new_name

func set_player_password(new_password: String) -> void:
	player_password = new_password  # Or store a hashed version

func set_player_email(new_email: String) -> void:
	player_email = new_email

# -------------------
# Dictionary Operations
# -------------------

func set_player_data(new_data: Dictionary) -> void:
	player_data = new_data

func update_player_data(key: String, value: Variant) -> void:
	player_data[key] = value

func remove_player_data_key(key: String) -> void:
	player_data.erase(key)

func clear_player_data() -> void:
	player_data.clear()

# -------------------
# File Operations
# -------------------

func save_player_data() -> void:
	pass

func load_player_data() -> void:
	# Load player data from a file or database
	pass

func reset_player_data() -> void:
	# Reset player data to default values
	pass
