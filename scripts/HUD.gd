extends Node

signal smpipis
signal mpipis
signal hpipis
signal cungadero
signal hcungadero
signal supipis
signal bigshot
signal bpipis
signal lpipis
signal hide_message


func _on_small_pipis_pressed():
	emit_signal('smpipis')


func _on_medium_pipis_pressed():
	emit_signal('mpipis')


func _on_cungadero_pressed():
	emit_signal('cungadero')


func _on_holy_cungadero_pressed():
	emit_signal('hcungadero')


func _on_super_pipis_pressed():
	emit_signal('supipis')


func _on_big_pipis_pressed():
	emit_signal('bpipis')


func _on_huge_pipis_pressed():
	emit_signal('hpipis')


func _on_big_shot_pressed():
	emit_signal('bigshot')


func _on_large_pipis_pressed():
	emit_signal('lpipis')



func _on_Timer_timeout():
	emit_signal('hide_message')

