extends VehicleBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	look_at = global_position
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
const MAX_STEER = 0.8
const ENGINE_POWER = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	steering = move_toward(steering, Input.get_axis("ui_right", "ui_left") * MAX_STEER, delta * 2.5)
	engine_force = Input.get_axis("ui_down", "ui_up") * ENGINE_POWER

@onready var camerapivot = $camerapivot
@onready var camera_3d = $camerapivot/Camera3D

var look_at




func _physics_process(delta):
	camerapivot.global_position = camerapivot.global_position.lerp(global_position,delta*20.0)
	camerapivot.transform = camerapivot.transform.interpolate_with(transform, delta*5.0)
	#look_at = look_at.lerp(global_position +linear_velocity, delta*5.0)
	#camera_3d.look_at(look_at)


func _on_cp_1_body_entered(body):
	if body==self:
		print("hello world")
