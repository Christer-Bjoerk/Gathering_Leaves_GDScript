extends Area2D

@export var speed = 400;

var screen_size

var player_health = 3

signal updateScore
signal game_over

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
		$AnimatedSprite2D.play("Walk")
	else:
		$AnimatedSprite2D.play("Idle")
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "Walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	# Prevent the player from leaving the screen
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _on_body_entered(body):
	# Collect items
	body.queue_free()
	updateScore.emit()
	$"SFX Player".play()

func update_player_colour():
	player_health -= 1
	
	# Changes the player's health
	if(player_health == 3):
		modulate.a8 = 255
	elif (player_health == 2):
		modulate.a8 = 150
	elif (player_health == 1):
		modulate.a8 = 100
	elif (player_health == 0):
		modulate.a8 = 0
		game_over.emit()
