extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 300


@onready var camera_pivot = $CameraPivot
@onready var camera_3d = $CameraPivot/Camera3D

var look_at

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	look_at = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	steering = move_toward(steering, Input.get_axis("ui_right","ui_left")*MAX_STEER,delta*2.5)
	engine_force =Input.get_axis("ui_up","ui_down")*ENGINE_POWER
	camera_pivot.global_position = camera_pivot.global_position.lerp(global_position,delta*20.0)
	camera_pivot.transform = camera_pivot.transform.interpolate_with(transform, delta*5.0)
	look_at = look_at.lerp(global_position +linear_velocity, delta*5.0)
	camera_3d.look_at(look_at)
