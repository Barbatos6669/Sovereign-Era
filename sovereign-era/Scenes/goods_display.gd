extends Control

## Goods Display Scene Script
## This script is attached to the Goods_Display node in the goods_display.tscn scene.
## It is responsible for displaying the player's goods stockpiled in the city.

# Reference to UI elements in the Goods Display scene
@onready var grain_display_label: Label = $HBoxContainer/Grain_Display_Label ## This is the grain display label
@onready var wood_display_label: Label = $HBoxContainer/Wood_Display_Label ## This is the wood display label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
