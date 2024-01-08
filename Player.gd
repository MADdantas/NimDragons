extends CharacterBody2D

@onready var line = $Line2D
@onready var _animated_sprite = $AnimatedSprite2D
@onready var jumpSound = $JumpSfx
@onready var landSound = $LandSfx

const MAX_FORCE = 600
const MIN_FORCE = 80
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var impulse = Vector2.ZERO
var lastVel = Vector2.ZERO
var lineDirection = Vector2.ZERO

var isHovering = false
var isAddingForce = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _mouse_enter():
	isHovering = true

func _mouse_exit():
	isHovering = false

func _physics_process(delta):
	# Get mouse position
	var mousePosition = get_global_mouse_position()
	
	var isNotMoving = velocity == Vector2.ZERO
	
	# Add the gravity.
	if not is_on_floor():
		if velocity.x > 0:
			_animated_sprite.flip_h = false
		else:
			_animated_sprite.flip_h = true
		_animated_sprite.play("on_air")
		velocity.y += gravity * delta
	## Slip on slopes
	elif get_floor_angle() != 0:
		velocity = Vector2(velocity.normalized().x*-200,velocity.y)
	# Stop when touch the ground
	else:
		velocity.x = 0.0
	
	if lastVel.y > 0 and is_on_floor():
		if lastVel.x > 0:
			_animated_sprite.flip_h = false
		else:
			_animated_sprite.flip_h = true
		jumpSound.stop()
		landSound.play()
		_animated_sprite.play("jump_end")
	
	# Bounce of walls
	if is_on_wall():
		velocity.x = lastVel.x * -0.5
	
	if isNotMoving and !isAddingForce:
		if !_animated_sprite.is_playing():
			_animated_sprite.play("idle")
	if !Global.gotCoin:
		if Input.is_action_pressed("select") and isHovering and isNotMoving:
			isAddingForce = true
			_animated_sprite.play("getting_impulse")
		
		# Handle jump
		if is_on_floor() and isAddingForce and isNotMoving:
			impulse = (get_global_transform().get_origin() - mousePosition) * 8
			# Limit impulse
			if impulse.length() > MAX_FORCE:
				impulse = impulse.normalized() * MAX_FORCE
			if impulse.length() < MIN_FORCE:
				impulse = Vector2.ZERO
			# Draw arrow
			line.clear_points()
			line.add_point(Vector2.ZERO)
			line.add_point(impulse/2)
			line.show()
		
		if Input.is_action_just_released("select") and is_on_floor() and isAddingForce:
			_animated_sprite.play("jump_start")
			jumpSound.play()
			line.hide()
			velocity = impulse
			isAddingForce = false
	
	lastVel = velocity
	move_and_slide()

