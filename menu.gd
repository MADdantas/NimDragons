extends Node2D


var started = false
@onready var sound = $Music

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.soundOn:
		sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if started:
		free()


func _on_quit_button_pressed():
	get_tree().quit()

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior


func _on_start_button_pressed():
	var next_level_resource = load("res://MainLevel.tscn")
	var next_level = next_level_resource.instantiate()
	
	get_parent().add_child(next_level)
	started = true


func _on_check_button_toggled(toggled_on):
	if toggled_on:
		Global.soundOn = true
		sound.play()
	else:
		Global.soundOn = false
		sound.stop()
