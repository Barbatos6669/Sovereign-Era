extends Node

## Account Creation Scene Script
## This script is attached to the AccountCreation node in the account_creation.tscn scene.
## It is responsible for handling account creation logic.

# Reference to UI elements in the Account Creation scene
@onready var create_button: Button = $AccountCreation_UI_Control/VBoxContainer/AccountCreation_Create_Button ## This is the create account button
@onready var back_button: Button = $AccountCreation_UI_Control/VBoxContainer/AccountCreation_Back_Button ## This is the back button
@onready var username_line_edit: LineEdit = $AccountCreation_UI_Control/VBoxContainer/AccountCreation_Username_LineEdit ## This is the username line edit
@onready var password_line_edit: LineEdit = $AccountCreation_UI_Control/VBoxContainer/AccountCreation_Password_LineEdit ## This is the password line edit

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	# Process logic, if needed, every frame.
	pass

## Called when the "Create Account" button is pressed
func _on_account_creation_create_button_pressed() -> void:
	Global.console_log("Create Account Button Pressed")
	# TODO: Add validation, account creation, and saving logic here.	

	# validate the username and password
	var username: String = username_line_edit.text
	var password: String = password_line_edit.text

	if username.length() < 4:
		Global.console_log("Username must be at least 4 characters long.")
		return

	if password.length() < 6:
		Global.console_log("Password must be at least 6 characters long.")
		return

	# check if the account already exists
	var account_file_path: String = "res://Data/Accounts/" + username + ".json"
	if FileAccess.file_exists(account_file_path):
		Global.console_log("Account already exists.")
		return 

	# create the account
	var account: Dictionary = {
		"username": username,
		"password": password,
	}
	# save the account
	var account_file: FileAccess = FileAccess.open(account_file_path, FileAccess.WRITE)
	account_file.store_string(JSON.stringify(account, "\t"))
	account_file.close()

	# create the player and city data
	var player_city_data: Dictionary = {
		"player": {
			"username": username,
			"city": "City"
		},
		"city": {
			"city_name": "City",
			"city_ID": 0,
			"city_population": 0,
			"city_owner": username,
			"city_location": Vector2(0, 0),
			"city_data": {},
			"is_player_capital": true
		}
	}

	# save the player and city data
	var player_city_file: FileAccess = FileAccess.open("res://Data/PlayerCityData/" + username + "_city.json", FileAccess.WRITE)
	player_city_file.store_string(JSON.stringify(player_city_data, "\t"))
	player_city_file.close()	

	Global.console_log("Account created successfully.")
	
	# load the login scene
	get_tree().change_scene_to_file("res://Scenes/login_scene.tscn")
	# remove the account creation scene
	queue_free()
	
func _on_account_creation_back_button_pressed() -> void:
	Global.console_log("Back Button Pressed")
	
	# load the login scene
	get_tree().change_scene_to_file("res://Scenes/login_scene.tscn")
	# remove the account creation scene
	queue_free()
