extends CSGBox3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var timer=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
var speed = Vector3(0, 1, 0) # This will move the box along the X axis
var x = -1
func _process(delta):
	timer+=delta
	#if(timer>=2):
		#timer=0
		##print("hello world")
		#if(visible==true):
			#visible = false
			#use_collision = false # Disable collision
		#else:
			#visible = true
			#use_collision = true
	position = position + x * speed * delta
	if(timer>=5):
		x*=-1
		timer = 0
		
