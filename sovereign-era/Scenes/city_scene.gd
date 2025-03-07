extends Node

# Reference to UI elements in the City scene
@onready var city_name_label: Label = $Control/VBoxContainer/HBoxContainer/CityName_Label
@onready var city_name_output_label: Label = $Control/VBoxContainer/HBoxContainer/CityName_Output_Label
@onready var population_label: Label = $Control/VBoxContainer/HBoxContainer2/population_Label
@onready var population_output_label: Label = $Control/VBoxContainer/HBoxContainer2/Population_Output_Label
@onready var city_owner_label: Label = $Control/VBoxContainer/HBoxContainer3/CityOwner_Label
@onready var city_owner_output_label: Label = $Control/VBoxContainer/HBoxContainer3/CityOwner_Output_Label
@onready var location_label: Label = $Control/VBoxContainer/HBoxContainer4/Location_Label
@onready var location_output_label: Label = $Control/VBoxContainer/HBoxContainer4/Location_Output_Label	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	city_owner_output_label.text = Global.current_player.player_name
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


 
