extends CSGBox3D

var chance = 400000
# Called when the node enters the scene tree for the first time.
func _ready():
	var time := randi_range(50,250)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rand = randi_range(0,chance)
	if rand == 200:
		visible = !visible
