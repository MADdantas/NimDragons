extends Camera2D

@export var player: CharacterBody2D
@export var bg_music: AudioStreamPlayer
var cameraHeight = 648

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.global_position.y < offset.y:
		offset.y -= cameraHeight
	elif player.global_position.y > offset.y and player.global_position.y > offset.y+cameraHeight:
		offset.y += cameraHeight



func _on_check_button_toggled(toggled_on):
	if toggled_on:
		Global.soundOn = true
		bg_music.play()
	else:
		Global.soundOn = false
		bg_music.stop()



func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
