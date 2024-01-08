extends Node

var current_scene = null

var playerWin = false

var gotCoin = false

var soundOn = true

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
