extends Node2D

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")


func _on_ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
