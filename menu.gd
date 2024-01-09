extends Node2D

@onready var sound = $Music

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.soundOn:
		sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):


func _on_quit_button_pressed():
	get_tree().quit()

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://MainLevel.tscn")


func _on_check_button_toggled(toggled_on):
	if toggled_on:
		Global.soundOn = true
		sound.play()
	else:
		Global.soundOn = false
		sound.stop()
