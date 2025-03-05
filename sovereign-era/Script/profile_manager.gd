extends Node

# UI panel references
@onready var login_panel: Control = $UI/LoginPanel
@onready var register_panel: Control = $UI/RegisterPanel

# Login panel UI elements
@onready var login_username_field: LineEdit = $UI/LoginPanel/VBoxContainer/UserName_LineEdit
@onready var login_password_field: LineEdit = $UI/LoginPanel/VBoxContainer/Password_LineEdit2
@onready var login_button: Button = $UI/LoginPanel/VBoxContainer/Login_Button
@onready var login_register_button: Button = $UI/LoginPanel/VBoxContainer/Register_Button

# Register panel UI elements
@onready var register_username_field: LineEdit = $UI/RegisterPanel/VBoxContainer/Reg_Username_LineEdit
@onready var register_password_field: LineEdit = $UI/RegisterPanel/VBoxContainer/Reg_Password_LineEdit
@onready var create_account_button: Button = $UI/RegisterPanel/VBoxContainer/Register_Button
@onready var back_button: Button = $UI/RegisterPanel/VBoxContainer/Back_Button

func _ready() -> void:
	# Start with login panel visible, register panel hidden
	register_panel.visible = false
	login_panel.visible = true

# Login button pressed: Verify credentials
func _on_login_button_pressed() -> void:
	print("Login Button Pressed")
	var username: String = login_username_field.text
	var password: String = login_password_field.text
	
	if username.is_empty() or password.is_empty():
		print("Error: Username and password cannot be empty")
		return
	
	var profile_data: Dictionary = load_profile_data(username)
	if profile_data != {} and profile_data["password"] == password:
		print("Login successful! Profile Data: ", profile_data)
	else:
		print("Invalid username or password")

# Switch to register panel
func _on_register_button_pressed() -> void:
	print("Register Button Pressed")
	register_panel.visible = true
	login_panel.visible = false

# Create account button pressed: Register new user
func _on_create_account_button_pressed() -> void:
	print("Create Account Button Pressed")
	var username: String = register_username_field.text
	var password: String = register_password_field.text
	
	# Basic input validation
	if username.is_empty() or password.is_empty():
		print("Error: Username and password cannot be empty")
		return
	if not username.is_valid_filename():
		print("Error: Username contains invalid characters for a filename")
		return
	
	# Check if profile already exists
	if load_profile_data(username) != {}:
		print("Error: Username already taken")
		return
	
	create_profile(username, password)
	print("Account created successfully")
	
	# Return to login panel
	register_panel.visible = false
	login_panel.visible = true
	
	# Clear fields
	register_username_field.text = ""
	register_password_field.text = ""

# Back button pressed: Return to login panel
func _on_back_button_pressed() -> void:
	print("Back Button Pressed")
	register_panel.visible = false
	login_panel.visible = true
	
	# Clear fields
	register_username_field.text = ""
	register_password_field.text = ""

# Create a new profile with given username and password
func create_profile(username: String, password: String) -> void:
	var data: Dictionary = {
		"username": username,
		"password": password  # Note: In production, hash this!
	}
	save_profile_data(username, data)

# Save profile data to a JSON file
func save_profile_data(username: String, data: Dictionary) -> void:
	var file_path: String = "res://Profiles/" + username + ".json"
	var file: FileAccess = FileAccess.open(file_path, FileAccess.ModeFlags.WRITE)
	
	if file != null:
		var json_string: String = JSON.stringify(data)
		file.store_string(json_string)
		file.close()
		print("Profile data saved for " + username + " at " + file_path)
	else:
		print("Error: Could not save file for " + username + " - ", FileAccess.get_open_error())

# Load profile data from a JSON file
func load_profile_data(username: String) -> Dictionary:
	var file_path: String = "res://Profiles/" + username + ".json"
	var file: FileAccess = FileAccess.open(file_path, FileAccess.ModeFlags.READ)
	
	if file != null:
		var json_string: String = file.get_as_text()
		file.close()
		var data = JSON.parse_string(json_string)
		if data != null and data is Dictionary:
			print("Profile data loaded for " + username)
			return data
		else:
			print("Error: Failed to parse JSON for " + username)
			return {}
	else:
		print("Error: Could not load file for " + username + " - ", FileAccess.get_open_error())
		return {}
