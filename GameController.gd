extends Node2D

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
	
func displayWin(win):
	if win:
		Global.playerWin = false
		get_tree().change_scene_to_file("res://WinScreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	displayWin(Global.playerWin)
