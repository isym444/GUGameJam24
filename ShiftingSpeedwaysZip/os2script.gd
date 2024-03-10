extends CSGBox3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var timer=0
var speed = Vector3(1, 0, 0) # This will move the box along the X axis

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=delta
	if(timer>=3):
		timer=0
		#print("hello world")
		if(visible==true):
			visible = false
			use_collision = false # Disable collision
		else:
			visible = true
			use_collision = true
	
