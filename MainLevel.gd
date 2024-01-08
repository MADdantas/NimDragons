extends Node2D

@onready var bg_music = $BackgroungSfx

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.soundOn:
		bg_music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.playerWin:
		free()


func _on_backgroung_sfx_finished():
	bg_music.play()
