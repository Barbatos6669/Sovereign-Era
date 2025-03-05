extends Node

@onready var login_panel: Control = $UI/LoginPanel
@onready var register_panel: Control = $UI/RegisterPanel

@onready var login_UserName: LineEdit = $UI/LoginPanel/VBoxContainer/UserName_LineEdit
@onready var login_Password: LineEdit = $UI/LoginPanel/VBoxContainer/Password_LineEdit2
@onready var login_Login: Button = $UI/LoginPanel/VBoxContainer/Login_Button
@onready var login_Register: Button = $UI/LoginPanel/VBoxContainer/Register_Button

@onready var register_UserName: LineEdit = $UI/RegisterPanel/VBoxContainer/Reg_Username_LineEdit
@onready var register_Password: LineEdit = $UI/RegisterPanel/VBoxContainer/Reg_Password_LineEdit
@onready var register_Register: Button = $UI/RegisterPanel/VBoxContainer/Back_Button
@onready var register_Back: Button = $UI/RegisterPanel/VBoxContainer/Register_Button

func _ready():
	register_panel.visible = false
	login_panel.visible = true

func _on_login_button_pressed() -> void:
	print("Login Button Pressed")
	var username = login_UserName.text
	var password = login_Password.text
	print("Username: ", username)
	print("Password: ", password)

	var profile_data = load_profile_data(username)
	if profile_data != {}:
		print("Profile data loaded successfully")
		print("Profile Data: ", profile_data)
	else:
		print("Error: Profile data not found")

func _on_register_button_pressed() -> void:
	print("Register Button Pressed")
	register_panel.visible = true
	login_panel.visible = false

func _on_create_account_button_pressed() -> void:
	print("Create Account Button Pressed")
	var username = register_UserName.text
	var password = register_Password.text
	print("Username: ", username)
	print("Password: ", password)

	register_panel.visible = false
	login_panel.visible = true

	create_profile(username, password)

func _on_back_button_pressed() -> void:
	print("Back Button Pressed")
	register_panel.visible = false
	login_panel.visible = true

func create_profile(username: String, password: String) -> void:
	var data = {
		"username": username,
		"password": password
	}
	save_profile_data(username, data)

func save_profile_data(username: String, data: Dictionary) -> void:
	# Use user:// instead of res:// for writable data
	var file = FileAccess.open("res://Profiles/" + username + ".json", FileAccess.ModeFlags.WRITE)
	print("Saving profile data for " + username)

	if file != null:
		print("File opened successfully")
		var json_string = JSON.stringify(data)
		print("JSON String: ", json_string)
		file.store_string(json_string)
		print("Profile data saved for " + username)
		file.close()
	else:
		print("Error: Could not save file for " + username)

func load_profile_data(username: String) -> Dictionary:
	var data = {}
	var file = FileAccess.open("res://Profiles/" + username + ".json", FileAccess.ModeFlags.READ)
	
	if file != null:
		print("File opened successfully")
		var json_string = file.get_as_text()
		print("JSON String: ", json_string)
		# Simplified JSON parsing using built-in method
		data = JSON.parse_string(json_string)
		if data != null:  # Check if parsing was successful
			print("Profile data loaded for " + username)
		else:
			print("Error: Failed to parse JSON for " + username)
		file.close()
	else:
		print("Error: Could not load file for " + username)

	return data if data != null else {}
