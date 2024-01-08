extends Node2D

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
	
func displayWin(win):
	if win:
		var level = $MainLevel
		# Remove the current level
		remove_child(level)
		level.call_deferred("free")

		# Add the next level
		var next_level_resource = load("res://WinScreen.tscn")
		var next_level = next_level_resource.instantiate()
		add_child(next_level)
		Global.playerWin = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	displayWin(Global.playerWin)
