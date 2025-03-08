extends Node

## City Scene Script
## This script is attached to the CityScene node in the city_scene.tscn scene.
## It is responsible for updating the city information displayed in the scene.

@onready var city_name_label: Label = $Control/VBoxContainer/HBoxContainer/CityName_Label ## This is the city name label
@onready var city_name_output_label: Label = $Control/VBoxContainer/HBoxContainer/CityName_Output_Label ## This is the city name output label
@onready var population_label: Label = $Control/VBoxContainer/HBoxContainer2/population_Label ## This is the population label
@onready var population_output_label: Label = $Control/VBoxContainer/HBoxContainer2/Population_Output_Label ## This is the population output label
@onready var city_owner_label: Label = $Control/VBoxContainer/HBoxContainer3/CityOwner_Label ## This is the city owner label
@onready var city_owner_output_label: Label = $Control/VBoxContainer/HBoxContainer3/CityOwner_Output_Label ## This is the city owner output label
@onready var location_label: Label = $Control/VBoxContainer/HBoxContainer4/Location_Label ## This is the location label
@onready var location_output_label: Label = $Control/VBoxContainer/HBoxContainer4/Location_Output_Label	 ## This is the location output label

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	pass




 
