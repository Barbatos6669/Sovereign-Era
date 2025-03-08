extends Node

var debug: bool = true # toggle debug print statements

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

## set_player
## This function is used to set the current player
## @param new_player: The new player object
## @return void
func set_player(new_player: Player) -> void:
	current_player = new_player	

# -------------------
# Global Functions
# -------------------

## save_game
## This function is called when the player saves the game
## It can be used to save the game state to a file or database
## @return void
func save_game() -> void:
	# Save game data to json file for now
	pass

## load_game
## This function is called when the player loads a saved game
## It can be used to load the game state from a file or database
## @return void
func load_game() -> void:
	# Load game data from a file or database
	pass

## reset_game
## This function is called when the player starts a new game
## It can be used to reset the game state to default values
## @return void
func reset_game() -> void:
	# Reset game data to default values
	pass

## quit_game
## This function is called when the player quits the game
## It can be used to save the game state, clean up resources, or perform any other necessary actions
## @return void
func quit_game() -> void:
	# Quit the game
	pass

## Debugging functions
## These functions are used to print debug messages to the console
## They can be toggled on or off by setting the debug variable to true or false
## This is useful for debugging the game and can be disabled in the final build
## by setting debug to false
## @param string: The string to print to the console
func console_log(string: String) -> void:
	if debug:
		print(string)




	
