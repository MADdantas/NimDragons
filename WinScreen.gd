extends Node2D

@onready var music = $Music

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.soundOn:
		music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):


func _on_quit_button_pressed():
	get_tree().quit()


func _on_menu_pressed():
	Global.playerWin = false
	Global.gotCoin = false
	Global.soundOn = true
	
	get_tree().change_scene_to_file("res://menu.tscn")
