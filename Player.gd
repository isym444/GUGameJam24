extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 300


@onready var camera_pivot = $CameraPivot
@onready var camera_3d = $CameraPivot/Camera3D

var look_at

var starting_position = Vector3()  # Set this to your character's starting position


#Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	look_at = global_position
	starting_position = global_transform.origin
	set_process_input(true)

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	steering = move_toward(steering, Input.get_axis("ui_right","ui_left")*MAX_STEER,delta*2.5)
	#if(Input.get_axis("ui_up","ui_down")):
		#$carsounds.play()
	engine_force =Input.get_axis("ui_up","ui_down")*ENGINE_POWER
	camera_pivot.global_position = camera_pivot.global_position.lerp(global_position,delta*20.0)
	camera_pivot.transform = camera_pivot.transform.interpolate_with(transform, delta*5.0)
	look_at = look_at.lerp(global_position +linear_velocity, delta*5.0)
	camera_3d.look_at(look_at)

var checker = 0
var timer=0
var lastpressed
func _process(delta):
	timer+=delta
	if Input.is_action_just_pressed("ui_up"):
		lastpressed=timer
		checker = 1
		$carsounds.play()
	if(checker==1 and timer-lastpressed>=4.3):
		$carsounds.play()
		lastpressed=timer
	if Input.is_action_just_released("ui_up"):
		$carsounds.stop()
		checker=0

func _on_area_3d_body_entered(body):
	if(body==self):
		global_transform.origin = starting_position

func _on_target_body_entered(body):
	if(body==self):
		print("Congrats you won!")
		global_transform.origin = starting_position


func _on_respawner_body_entered(body):
	if(body==self):
		linear_velocity = Vector3.ZERO  # Stop any linear movement
		angular_velocity = Vector3.ZERO  # Stop any rotational movement
		global_transform.origin = starting_position
