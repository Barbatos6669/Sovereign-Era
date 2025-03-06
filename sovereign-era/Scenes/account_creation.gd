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
	print("Create Account Button Pressed")
	# TODO: Add validation, account creation, and saving logic here.
	# For example, read username_line_edit.text and password_line_edit.text,
	# then create the account, update your global data, etc.

	# validate the username and password
	var username = username_line_edit.text
	var password = password_line_edit.text

	if username == "" or password == "":
		print("Username and password cannot be empty")
		return

	# create the account
	var account = {
		"username": username,
		"password": password
	}

	# save the account
	var account_file = FileAccess.open("res://Data/Accounts/" + username + ".json", FileAccess.WRITE)
	account_file.store_string(JSON.stringify(account))
	account_file.close()
	
	# load the login scene
	get_tree().change_scene_to_file("res://Scenes/login_scene.tscn")
	# remove the account creation scene
	queue_free()
	
func _on_account_creation_back_button_pressed() -> void:
	print("Back Button Pressed")
	
	# load the login scene
	get_tree().change_scene_to_file("res://Scenes/login_scene.tscn")
	# remove the account creation scene
	queue_free()
