extends Node2D

@onready var music = $Music
var backToMenu = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.soundOn:
		music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if backToMenu:
		free()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_menu_pressed():
	Global.playerWin = false
	Global.gotCoin = false
	Global.soundOn = true
	
	var next_level_resource = load("res://menu.tscn")
	var next_level = next_level_resource.instantiate()
	
	get_parent().add_child(next_level)
	
	backToMenu = true
	
