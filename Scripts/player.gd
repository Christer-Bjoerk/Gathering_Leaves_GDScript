extends Area2D

@export var speed = 400;

var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	
	var velocity = Vector2.ZERO
	
	# Movement
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	# Prevent the player from leaving the screen
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
