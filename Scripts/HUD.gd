extends CanvasLayer

var playerHealth = 3

signal start_game
signal update_player_sprite

func _ready():
	in_game_hud(false)

func update_score(score):
	$ScoreLabel.text = str(score)
	
func _on_play_button_pressed():
	$PlayButton.hide()
	start_game.emit()
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func _on_message_timer_timeout():
	$Message.hide()

func in_game_hud(active):
	if active:
		$ScoreLabel.show()
		$Message.show()
	elif !active:
		$ScoreLabel.hide()
		$Message.hide()

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$PlayButton.show()
	
