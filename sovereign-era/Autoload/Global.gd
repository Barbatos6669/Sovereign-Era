extends Node

# Singleton script for global variables and functions that are used across multiple scenes
var current_player: Player = Player.new()
var current_city: City = City.new()

var player_data: Dictionary = {}
var city_data: Dictionary = {}

# City globals




func _ready() -> void:	
	pass    

func _init():
	pass

# -------------------
# Player Operations
# -------------------

func get_player() -> Player:
	return current_player

func set_player(new_player: Player) -> void:
	current_player = new_player

# -------------------
# Global Functions
# -------------------

func save_game() -> void:
	# Save game data to a file or database
	pass

func load_game() -> void:
	# Load game data from a file or database
	pass

func reset_game() -> void:
	# Reset game data to default values
	pass

func quit_game() -> void:
	# Quit the game
	pass

# -------------------
# Scene Management
# -------------------





	
