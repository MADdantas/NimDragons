extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var sound = $CoinSfx
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = Vector2(691,-4250)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !sound.is_playing() and Global.gotCoin:
		Global.playerWin = true


func _on_body_entered(_body):
	sound.play()
	remove_child(sprite)
	Global.gotCoin = true
