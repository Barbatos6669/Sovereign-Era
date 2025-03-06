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
func _process(delta: float) -> void:
	pass

func _on_login_button_pressed() -> void:	
	print("Login Button Pressed")

	# Validate the username and password
	var username = username_line_edit.text
	var password = password_line_edit.text

	if username == "" or password == "":
		print("Username and password cannot be empty")
		return

	# check if the account exists
	var filepath = "res://Data/Accounts/" + username + ".json"
	var account_file = FileAccess.open(filepath, FileAccess.ModeFlags.READ)
	print("Checking if account exists: " + filepath)

	# TODO: Add logic to check if the account exists and if the password is correct	

func _on_create_account_button_pressed() -> void:
	print("Create Account Button Pressed")

	# Load the account creation scene
	var account_creation_scene = preload("res://Scenes/account_creation.tscn")
	var account_creation_scene_instance = account_creation_scene.instantiate()
	get_tree().get_root().add_child(account_creation_scene_instance)

	var login_scene = get_tree().get_current_scene()
	login_scene.queue_free()
	
