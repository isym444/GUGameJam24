extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_right", "move_left", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

var starting_position = Vector3()  # Set this to your character's starting position

func _ready():
	# Save the starting position when the game starts
	starting_position = global_transform.origin

func _on_Area_body_entered(body):
	if body == self:
		# Teleport the character back to the starting position
		global_transform.origin = starting_position


func _on_area_3d_body_entered(body):
	if body == self:
		global_transform.origin = starting_position  # Reset position

func _process(_delta):  # Now _delta is properly prefixed since it's not used.
	# Make sure you use the correct path to access the CamYaw node.
	# The path should start from the current script's location (CharacterBody3D).
	var cam_yaw = $CamYaw  # If CamYaw is a direct child of CharacterBody3D.
	# OR, if it's nested, for example:
	# var cam_yaw = $Node3D/CamYaw  # Use the correct path based on your hierarchy.
	
	if cam_yaw:
		cam_yaw.rotation.y = rotation.y
	else:
		print("CamYaw node not found. Check the node path.")

