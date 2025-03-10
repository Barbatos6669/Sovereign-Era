extends Node

var debug: bool = true # toggle debug print statements

# Singleton script for global variables and functions that are used across multiple scenes
var current_player: Player = Player.new()

func _ready() -> void:	
	pass    

func _init():
	pass

func console_log(string: String) -> void:
	if debug:
		print(string)




	
