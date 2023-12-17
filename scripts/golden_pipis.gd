extends Node2D

var clicked = false


func _on_golden_pipis_button_pressed():
	if get_parent().get_node('pause').visible == false:
		clicked = true
		print('tak1')
