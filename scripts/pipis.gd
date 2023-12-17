extends Node2D

signal click

func _ready():
	randomize()
	var mspipis = int(rand_range(1, 10))
	get_node("miss_pipis").hide()
	if mspipis == 1:
		get_node("pipis_n").hide()
		get_node("miss_pipis").show()

func _on_TextureButton_pressed():
	emit_signal('click')
