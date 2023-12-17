extends Node2D

#signal reset
signal pause
signal songChange(songID)

var pause = false
var songNames = ['Spamton', "Now's your chance to be a", 'Hey every!!', 'Dialtone', 'Real boy']


func _ready():
	hide()
	$restartBox.hide()
	$CanvasLayer.hide()
	for name in songNames:
		$CanvasLayer/songSelect.add_item(name)


func _process(_delta):
	if Input.is_action_just_pressed('pause'):
		if pause == false:
			show()
			$CanvasLayer.show()
			pause = true
			get_parent().get_node('golden_pipis_spawn_timer').paused = true
			get_parent().get_node("golden_pipis_bonus").paused = true
			get_parent().get_node("golden_pipis_disapear").paused = true
		else:
			exit_pause()
		emit_signal('pause')
		$restartBox/Label.visible_characters = 0
	
	
	if $restartBox.visible == true:
		$restartBox/Label.visible_characters += 2
	else:
		$restartBox/Label.visible_characters = 0
	
	
	$fullscreen.pressed = OS.window_fullscreen


func _on_exit_pressed():
	get_tree().quit()


func _on_continue_pressed():
	get_parent().get_node('golden_pipis_spawn_timer').start()
	exit_pause()


func _on_fullscreen_toggled(button_pressed):
	OS.set_window_fullscreen(button_pressed)


func _on_restart_pressed():
	$restartBox.show()


func _on_restartYes_pressed():
#	$CanvasLayer/songSelect.select(0)
#	if len($CanvasLayer/songSelect.items) > 25:
#		$CanvasLayer/songSelect.remove_item(5)
#	emit_signal("songChange", 0)
#	emit_signal('reset')
#	$restartBox/Label.visible_characters = 0
#	exit_pause()
	print(get_tree().reload_current_scene())


func _on_restartNo_pressed():
	$restartBox.hide()
	$restartBox/Label.visible_characters = 0



func _on_songSelect_item_selected(index):
	emit_signal("songChange", index)


func exit_pause():
	$CanvasLayer.hide()
	$restartBox.hide()
	hide()
	pause = false
	get_parent().get_node('golden_pipis_spawn_timer').paused = false
	get_parent().get_node("golden_pipis_bonus").paused = false
	get_parent().get_node("golden_pipis_disapear").paused = false
	emit_signal('pause')


func _on_songSelect_pressed():
	$CanvasLayer/songSelect.get_child(0).add_font_override("font", load('res://fonts/DELTARUNE-font-size32.tres'))
