# Attached to the Label node
extends Label

func _ready():
	# Update label text with the global variable on startup
	text = str(Globals.winningPlayer)+" wins!"

# Optionally, if the global variable changes and you want to update the label every frame:
func _process(delta):
	text = str(Globals.winningPlayer)+" wins!"
