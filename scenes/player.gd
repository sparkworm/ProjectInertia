class_name Player
extends Node

@export var player_name: String = "Unnamed Player"
@export var color: Color = Color(0.8, 0.2, 0.2)

@export var ship: Ship

@export_category("Keybinds")
@export var key_left: String
@export var key_right: String
@export var key_up: String
@export var key_down: String
@export var key_special: String

func _ready() -> void:
	ship.set_color(color)

func _physics_process(_delta: float) -> void:
	# handle movement
	var fb: float = Input.get_axis(key_down, key_up)
	var lr: float = Input.get_axis(key_left, key_right)
	ship.handle_movement(fb, lr)
	
	# handle special
	if Input.is_action_just_pressed(key_special):
		ship.special_pressed()
	if Input.is_action_just_released(key_special):
		ship.special_released()
