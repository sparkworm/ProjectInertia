extends Node2D

@onready var camera_2d: Camera2D = $Camera2D

@onready var border_top: StaticBody2D = $Borders/BorderTop
@onready var border_bottom: StaticBody2D = $Borders/BorderBottom
@onready var border_left: StaticBody2D = $Borders/BorderLeft
@onready var border_right: StaticBody2D = $Borders/BorderRight

func _ready() -> void:
	set_borders()

func set_borders() -> void:
	# WARNING: might not account for stretch; I haven't checked
	var dimensions: Vector2 = get_viewport_rect().size
	
	# The borders are 20x20, ik magic numbers are bad form
	# TODO: fix magic numbers
	border_left.position.x = -dimensions.x / 2 - 10
	border_right.position.x = dimensions.x / 2 + 10
	border_top.position.y = -dimensions.y / 2 - 10
	border_bottom.position.y = dimensions.y / 2 + 10
	
	# The borders are 20x20, ik magic numbers are bad form
	# TODO: fix magic numbers
	border_left.scale.y = dimensions.y / 20
	border_right.scale.y = dimensions.y / 20
	border_top.scale.x = dimensions.x / 20
	border_bottom.scale.x = dimensions.x / 20
	
	
