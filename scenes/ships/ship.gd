class_name Ship
extends RigidBody2D

@export var forward_thrust: float = 150
@export var backward_thrust: float = 50
@export var turning_thrust: float = 200

# Should probably replace with a more modular system of specials
@export var afterburner_boost: float = 3.0
var afterburner: bool = false

@onready var body_shape: Polygon2D = $BodyShape
@onready var thrust_particles: GPUParticles2D = $ThrustParticles

func _ready() -> void:
	thrust_particles.emitting = false

func set_color(color: Color) -> void:
	body_shape.color = color

## Handles turning and acceleration
## [br]
## fb is forward backward/input, lr is left/right input.
## Both should be on domain [-1.0, 1.0]
func handle_movement(fb: float, lr: float) -> void:
	if fb > 0.0:
		thrust_particles.emitting = true
		# for keyboard, fb will always have magnitude 1
		var force: Vector2 = fb * Vector2.from_angle(rotation) * forward_thrust
		if afterburner:
			force *= afterburner_boost
		apply_central_force(force)
	elif fb < 0.0:
		thrust_particles.emitting = false
		# for keyboard, fb will always have magnitude 1
		apply_central_force(fb * Vector2.from_angle(rotation) * backward_thrust)
	else:
		thrust_particles.emitting = false
	
	if lr != 0.0:
		# for keyboard, lr will always have magnitude 1
		apply_torque(lr * turning_thrust)

## Eventually this may be replaced with a more modular system, but we'll just
## hardcode an afterburner for now
func special_pressed() -> void:
	afterburner = true

func special_released() -> void:
	afterburner = false
