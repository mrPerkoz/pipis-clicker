extends Node

var pipis_amount = 0
var added_pipis = 1
var pause
var music_offset = 0
export(PackedScene) var golden_pipis
var old_added_pipis = added_pipis
var songs = ['res://sound/spamton.ogg', "res://sound/now's_your_chance_to_be_a.ogg", 'res://sound/hey_every.ogg', 'res://sound/dialtone.ogg', 'res://sound/real_boy.ogg', 'res://sound/big_shot.ogg']
var isBigShot = false
onready var current_gpipis_timer = $golden_pipis_timer_offset
var gpipises = false

var spipis = 10
var mpipis = 100
var bpipis = 500
var hpipis = 1000
var lpipis = 5000
var supipis = 10000
var cungadero = 20000
var hcungadero = 50000
var bigshot = 1000000


func _on_pipis_click():
	pipis_amount += added_pipis


func _ready():
	randomize()
#	OS.set_window_size(Vector2(1200,900))
	OS.set_window_maximized(true)
#	OS.window_fullscreen = true


func _process(_delta):
	pipis_amount = stepify(pipis_amount, 0.1)
	added_pipis = stepify(added_pipis, 0.1)
	$HUD/pipis_label.text = str(pipis_amount)
	$HUD/income_label.text = str(added_pipis)
#	if Input.is_action_just_pressed('pause'):
#		if $pause.pause == false:
#			$pause.show()
#			$pause.pause = true
##			$golden_pipis_spawn_timer.stop()
##			if $golden_pipis_timer_offset.is_stopped() == false and $golden_pipis_bonus.is_stopped() == true:
##				$golden_pipis_timer_offset.stop()
##				print('asdfsdg')
##				current_gpipis_timer = get_node('golden_pipis_timer_offset')
##			elif $golden_pipis_spawn_timer.is_stopped() == false and $golden_pipis_bonus.is_stopped() == true:
##				$golden_pipis_spawn_timer.stop()
##				print('ghghfgj')
##				current_gpipis_timer = get_node('golden_pipis_spawn_timer')
#			$golden_pipis_spawn_timer.stop()
#		else:
#			$pause.hide()
#			$pause.pause = false
##			$golden_pipis_spawn_timer.start()
#			$golden_pipis_spawn_timer.start()
	
	
	if Input.is_action_just_pressed('fullscreen'):
		OS.window_fullscreen = !OS.window_fullscreen
	
	for i in get_children():
		if i.get_script() == load('res://scripts/golden_pipis.gd') and i.clicked == true:
			print('tak2')
			old_added_pipis = added_pipis
			added_pipis += stepify(added_pipis * 0.3, 0.1)
			$golden_pipis_bonus.start()
			$golden_pipis_spawn_timer.stop()
			gpipises = false
			
			i.queue_free()


func _on_HUD_bigshot():
	if pipis_amount >= bigshot:
		if $golden_pipis_bonus.is_stopped() == false:
			old_added_pipis += 500
			added_pipis += stepify(500 * 1.3, 0.1)
		else:
			added_pipis += 500
		
		pipis_amount -= round(bigshot)
		bigshot += bigshot * 0.2
		$HUD/big_shot.text = 'BIG SHOT!!! (' + str(round(bigshot)) + ' Kromer)'
		if isBigShot == false:
			isBigShot = true
			$pause/CanvasLayer/songSelect.add_item('Big Shot')
	else:
		$HUD/Timer.start()
		$HUD/NEp_node2D.show()
		

func _on_HUD_bpipis():
	if pipis_amount >= bpipis:
		if $golden_pipis_bonus.is_stopped() == false:
			old_added_pipis += 1
			added_pipis += stepify(1 * 1.3, 0.1)
		else:
			added_pipis += 1
		pipis_amount -= round(bpipis)
		bpipis += bpipis * 0.2
		$HUD/big_pipis.text = 'big pipis (' + str(round(bpipis)) + ' Kromer)'
	else:
		$HUD/Timer.start()
		$HUD/NEp_node2D.show()


func _on_HUD_cungadero():
	if pipis_amount >= cungadero:
		if $golden_pipis_bonus.is_stopped() == false:
			old_added_pipis += 50
			added_pipis += stepify(50 * 1.3, 0.1)
		else:
			added_pipis += 50
		pipis_amount -= round(cungadero)
		cungadero += cungadero * 0.2
		$HUD/cungadero.text = 'cungadero (' + str(round(cungadero)) + ' Kromer)'
	else:
		$HUD/Timer.start()
		$HUD/NEp_node2D.show()


func _on_HUD_hcungadero():
	if pipis_amount >= hcungadero:
		if $golden_pipis_bonus.is_stopped() == false:
			old_added_pipis += 75
			added_pipis += stepify(75 * 1.3, 0.1)
		else:
			added_pipis += 75
		pipis_amount -= round(hcungadero)
		hcungadero += hcungadero * 0.2
		$HUD/holy_cungadero.text = 'holy cungadero (' + str(round(hcungadero)) + ' Kromer)'
	else:
		$HUD/Timer.start()
		$HUD/NEp_node2D.show()


func _on_HUD_hpipis():
	if pipis_amount >= hpipis:
		if $golden_pipis_bonus.is_stopped() == false:
			old_added_pipis += 5
			added_pipis += stepify(5 * 1.3, 0.1)
		else:
			added_pipis += 5
		pipis_amount -= round(hpipis)
		hpipis += hpipis * 0.2
		$HUD/huge_pipis.text = 'huge pipis (' + str(round(hpipis)) + ' Kromer)'
	else:
		$HUD/Timer.start()
		$HUD/NEp_node2D.show()


func _on_HUD_lpipis():
	if pipis_amount >= lpipis:
		if $golden_pipis_bonus.is_stopped() == false:
			old_added_pipis += 10
			added_pipis += stepify(10 * 1.3, 0.1)
		else:
			added_pipis += 10
		pipis_amount -= round(lpipis)
		lpipis += lpipis * 0.2
		$HUD/large_pipis.text = 'large pipis (' + str(round(lpipis)) + ' Kromer)'
	else:
		$HUD/Timer.start()
		$HUD/NEp_node2D.show()


func _on_HUD_mpipis():
	if pipis_amount >= mpipis:
		if $golden_pipis_bonus.is_stopped() == false:
			old_added_pipis += 0.5
			added_pipis += stepify(0.5 * 1.3, 0.1)
		else:
			added_pipis += 0.5
		pipis_amount -= round(mpipis)
		mpipis += mpipis * 0.2
		$HUD/medium_pipis.text = 'medium pipis (' + str(round(mpipis)) + ' Kromer)'
	else:
		$HUD/Timer.start()
		$HUD/NEp_node2D.show()


func _on_HUD_smpipis():
	if pipis_amount >= spipis:
		if $golden_pipis_bonus.is_stopped() == false:
			old_added_pipis += 0.1
			added_pipis += stepify(0.1 * 1.3, 0.1)
		else:
			added_pipis += 0.1
		pipis_amount -= round(spipis)
		spipis += spipis * 0.2
		$HUD/small_pipis.text = 'small pipis (' + str(round(spipis)) + ' Kromer)'
	else:
		$HUD/Timer.start()
		$HUD/NEp_node2D.show()


func _on_HUD_supipis():
	if pipis_amount >= supipis:
		if $golden_pipis_bonus.is_stopped() == false:
			old_added_pipis += 20
			added_pipis += stepify(20 * 1.3, 0.1)
		else:
			added_pipis += 20
		pipis_amount -= round(supipis)
		supipis += supipis * 0.2
		$HUD/super_pipis.text = 'super pipis (' + str(round(supipis)) + ' Kromer)'
	else:
		$HUD/Timer.start()
		$HUD/NEp_node2D.show()


func _on_HUD_hide_message():
	$HUD/NEp_node2D.hide()


#func _on_pause_reset():
#	pipis_amount = 0
#	added_pipis = 1
#	old_added_pipis = added_pipis
#	music_offset = 0
#
#	$golden_pipis_spawn_timer.start()
#	_on_golden_pipis_bonus_timeout()
#	get_tree().call_group("gold_pipis", "queue_free")
#
#	var mspipis = int(rand_range(1, 10))
#	$pipis/pipis_n.show()
#	$pipis/miss_pipis.hide()
#	if mspipis == 1:
#		$pipis/pipis_n.hide()
#		$pipis/miss_pipis.show()


func _on_pause_pause():
	if $AudioStreamPlayer.playing == true:
		music_offset = $AudioStreamPlayer.get_playback_position()
		$AudioStreamPlayer.stop()
	else:
		$AudioStreamPlayer.play(music_offset)


func _on_golden_pipis_spawn_timer_timeout():
	var golden_pipis_timer = randi() % 5
	for i in get_children():
		if i.get_script() == load('res://scripts/golden_pipis.gd'):
			gpipises = true
			
	if golden_pipis_timer == 0 and gpipises == false:
		var gpipis = golden_pipis.instance()
		var golden_pipis_spawn_location = get_node("golden_pipis_spawn_path/golden_pipis_spawn_location")
		golden_pipis_spawn_location.offset = randi()
		gpipis.position = golden_pipis_spawn_location.position
		gpipis.set_script(load('res://scripts/golden_pipis.gd'))
		add_child(gpipis)
		$golden_pipis_disapear.start()
	print('dsadsa')


func _on_golden_pipis_timer_offset_timeout():
	$golden_pipis_spawn_timer.start()
	current_gpipis_timer = $golden_pipis_spawn_timer
	print('asdasd')


func _on_golden_pipis_disapear_timeout():
	get_tree().call_group("gold_pipis", "queue_free")
	gpipises = false


func _on_golden_pipis_bonus_timeout():
	added_pipis = old_added_pipis
	print("tak3")
	$golden_pipis_spawn_timer.start()
	current_gpipis_timer = $golden_pipis_timer_offset


func _on_pause_songChange(songID):
	$AudioStreamPlayer.set_stream(load(songs[songID]))
	music_offset = 0
