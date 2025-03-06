extends Control

var user_logged_in: String = "Player" # default value

@onready var main_scene: Node = $"."
# UI panel references
@onready var username_label: Control = $VBoxContainer/UserName_Label
@onready var options_button: Control = $VBoxContainer/Player_Button
@onready var logout_button: Control = $VBoxContainer/Options_Button

func _ready() -> void:
	print("Main Menu Ready")

func _on_play_button_pressed() -> void:
	print("Play Button Pressed")    


func _on_options_button_pressed() -> void:
	print("Options Button Pressed")


func _on_logout_button_pressed() -> void:
	print("Logout Button Pressed")
