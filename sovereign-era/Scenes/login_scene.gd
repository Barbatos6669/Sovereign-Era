extends Node

# Reference the child nodes
@onready var login_button: Button = $Login_UI_Control/VBoxContainer/Login_Button
@onready var create_account_button: Button = $Login_UI_Control/VBoxContainer/Create_Account_Button
@onready var username_line_edit: LineEdit = $Login_UI_Control/VBoxContainer/Login_Username_LineEdit
@onready var password_line_edit: LineEdit = $Login_UI_Control/VBoxContainer/Login_Password_LineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_login_button_pressed() -> void:    
	Global.console_log("Login Button Pressed")

	# Validate username and password
	var username: String = username_line_edit.text
	var password: String = password_line_edit.text

	# Make sure there is input in the username edit line
	if username.length() < 4:
		Global.console_log("Username must be at least 4 characters long.")
		return

	# Make sure there is a password inputted
	if password.length() < 6:
		Global.console_log("Password must be at least 6 characters long.")
		return

	# Check if the account exists
	var account_file_path: String = "res://Data/Accounts/" + username + ".json"
	if not FileAccess.file_exists(account_file_path):
		Global.console_log("Account does not exist.")
		return
	
	# If there is no return, the file exists
	Global.console_log("Account exists.")

	# Open the account file
	var account_file: FileAccess = FileAccess.open(account_file_path, FileAccess.READ)
	if account_file == null:
		Global.console_log("Error opening account file.")
		return
		
	# The file opened
	Global.console_log("Account file opened.")

	# Read and parse the account data
	var json_parser: JSON = JSON.new() 
	var parse_result: int = json_parser.parse(account_file.get_as_text())

	# Ensure the file is closed before returning on error
	account_file.close()

	if parse_result != OK:
		Global.console_log("Error parsing account file. Code: " + str(parse_result))
		return

	var account_data: Dictionary = json_parser.data
	Global.console_log("Account data loaded.")

	# Check if the password is correct
	if not account_data.has("password") or account_data["password"] != password:
		Global.console_log("Incorrect password.")
		return

	# Password is correct
	Global.console_log("Password correct, logging in.")

	# Load the player and city data (duplicate to avoid accidental modifications)
	Global.player_data = account_data.duplicate(true)	 

	# Load the city scene efficiently
	var city_scene: PackedScene = preload("res://Scenes/city_scene.tscn")

	# Prevent unnecessary scene loading if already in city scene
	if get_tree().get_current_scene().scene_file_path != "res://Scenes/city_scene.tscn":
		get_tree().change_scene_to_packed(city_scene)

func _on_create_account_button_pressed() -> void:
	Global.console_log("Create Account Button Pressed")

	# Load the account creation scene
	var account_creation_scene: PackedScene = preload("res://Scenes/account_creation.tscn")
	Global.console_log("Account Creation Scene Loaded")
	
	var account_creation_scene_instance: Node = account_creation_scene.instantiate()
	Global.console_log("Account Creation Scene Instantiated")
	
	get_tree().get_root().add_child(account_creation_scene_instance)
	Global.console_log("Account Creation Scene Added to Scene Tree")
