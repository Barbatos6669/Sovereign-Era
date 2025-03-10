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
