extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var mapTile = load("res://trackBox.tscn")
	var tile = mapTile.instantiate()
	add_child(tile)
	print($MapSpawner.$tile.time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
