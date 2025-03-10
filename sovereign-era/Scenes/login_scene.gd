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

	if username.length() < 4:
		Global.console_log("Username must be at least 4 characters long.")
		return

	if password.length() < 6:
		Global.console_log("Password must be at least 6 characters long.")
		return

	# Check if the account exists
	var account_file_path: String = "res://Data/Accounts/" + username + ".json"
	if not FileAccess.file_exists(account_file_path):
		Global.console_log("Account does not exist.")
		return

	Global.console_log("Account exists.")
	
	# open the account file
	var file: FileAccess = FileAccess.open(account_file_path, FileAccess.READ)
	var account_data: String = file.get_as_text()
	file.close()

	Global.console_log("Account data: " + account_data)

	# Parse the account data
	var account: Dictionary = JSON.parse_string(account_data)
	print(account)
	
	# Change the scene to the city scene	
	get_tree().change_scene_to_file("res://Scenes/city_scene.tscn")

func _on_create_account_button_pressed() -> void:
	Global.console_log("Create Account Button Pressed")
	
	get_tree().change_scene_to_file("res://Scenes/account_creation.tscn")
