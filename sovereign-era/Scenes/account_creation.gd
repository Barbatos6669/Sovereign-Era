extends Node

# Reference to UI elements in the Account Creation scene
@onready var create_button: Button = $AccountCreation_UI_Control/VBoxContainer/AccountCreation_Create_Button
@onready var back_button: Button = $AccountCreation_UI_Control/VBoxContainer/AccountCreation_Back_Button
@onready var username_line_edit: LineEdit = $AccountCreation_UI_Control/VBoxContainer/AccountCreation_Username_LineEdit
@onready var password_line_edit: LineEdit = $AccountCreation_UI_Control/VBoxContainer/AccountCreation_Password_LineEdit

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Process logic, if needed, every frame.
	pass

# Called when the "Create Account" button is pressed
func _on_account_creation_create_button_pressed() -> void:
	Global.console_log("Create Account Button Pressed")
	# TODO: Add validation, account creation, and saving logic here.	

	# validate the username and password
	var username = username_line_edit.text
	var password = password_line_edit.text

	if username.length() < 4:
		Global.console_log("Username must be at least 4 characters long.")
		return

	if password.length() < 6:
		Global.console_log("Password must be at least 6 characters long.")
		return

	# check if the account already exists
	var account_file_path = "res://Data/Accounts/" + username + ".json"
	if FileAccess.file_exists(account_file_path):
		Global.console_log("Account already exists.")
		return 

	# create the account
	var account = {
		"username": username,
		"password": password
	}

	# save the account
	var account_file = FileAccess.open("res://Data/Accounts/" + username + ".json", FileAccess.WRITE)
	account_file.store_string(JSON.stringify(account, "\t"))
	account_file.close()

	# create the player and city data
	var player_city_data = {
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
	var player_city_file = FileAccess.open("res://Data/PlayerCityData/" + username + "_city.json", FileAccess.WRITE)
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
